setwd("D:/Download/exdata_data_household_power_consumption/")
## Getting full dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
rm_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
c_data <- paste(as.Date(rm_data$Date), rm_data$Time)
rm_data$Datetime <- as.POSIXct(c_data)

## Plot 2
plot(rm_data$Global_active_power~rm_data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

