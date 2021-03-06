#!/bin/bash

# install mysql
yum install -q -y wget
wget -q https://repo.mysql.com/mysql57-community-release-el7.rpm
yum localinstall -q -y mysql57-community-release-el7.rpm
yum install -q -y mysql-community-server mysql-community-devel

# copy mysql connector
cp /usr/java/latest/mysql-connector-java.jar /opt/cm/share/cmf/lib/

# config autostart
chkconfig ntpd on
chkconfig mysqld on

# clean
yum remove -q -y wget
yum clean all
rm -rf /var/cache/yum/*
rm -f /etc/yum.repo.d/mysql-community*
rm -f mysql57-community-release-el7.rpm /cloudera-init/run/config-env.sh
