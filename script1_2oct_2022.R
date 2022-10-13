library(ggplot2)
library(EnvStats)
library(alr3)
library(car)


# read the data
particle <- read.csv("particle.csv", sep=";")
vapor <- read.csv("vapor.csv", sep=";")
library(ggplot2)

# the str  for particle and vapor
str(particle)
as.factor(particle$matrix)
as.factor(particle$seaon)
as.factor(particle$rep)
as.factor(particle$rep_day)
as.factor(particle$herbi)
as.factor(particle$noozle)
as.factor(particle$distance)


str(vapor)
as.factor(vapor$season)
as.factor(vapor$rep)
as.factor(vapor$day_rep)
as.factor(vapor$herbi)
as.factor(vapor$noozle)
as.factor(vapor$time)


# make the figure
# Use data from numeric vectors

# Basic plot
qplot(season, amount_air, data=vapor, color=noozle)

# Change the colors manually
p <- ggplot(data=vapor, aes(x=season, y=amount_air, fill=noozle)) +
  geom_bar(stat="identity", color="black", position=position_dodge())+
  theme_minimal()

#the boxplot that been divided into 1,2,4 replication
ggplot(data=vapor, aes(x=season, y=amount_air)) + 
  geom_boxplot(aes(fill=noozle)) +
  theme_minimal() + xlab("Season of Sampling") +
  ylab("The amount of Herbicide in Air")+
  facet_wrap( ~ rep, scales="free")




