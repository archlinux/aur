pkgname=panamfs-scan
arch=(x86_64)
pkgver='1.3.0'
pkgrel=1
source=(http://cs.psn-web.net/support/fax/common/file/Linux_ScanDriver/panamfs-scan-1.3.0-x86_64.tar.gz)
md5sums=('2e4c844e89c2e7e0b6258be5ef52ace9')
#package(){
##! /bin/sh
##
## batch file to install Panasonic MFS Scanner Driver
##
#
#################################################################################
##
## Make sure only root can run our script
##
#if [ "$(id -u)" != "0" ]; then
#   echo "    Install MUST be run as root" 1>&2
#   exit 1
#fi
#
#_ver="1.3.0"
#INSTALL_PATH="/usr/local/share/panasonic/scanner"
#INSTALL_SANE_DATA_PATH="/usr/local/share/panasonic/scanner"
#INSTALL_BIN_PATH="/usr/bin"
#
#
#BUILD_CPU=x86_64
#TARGET_CPU=`uname -m`
#
#################################################################################
##
## check can install to thie system
##
#CAN_INSTALL=no
#SANE_PATH_SEARCH="/usr/lib/sane"
#
#case $TARGET_CPU in
#	i[345]86)
#		case $BUILD_CPU in
#			i386)
#				CAN_INSTALL=yes
#			;;
#		esac
#	;;
#	i686)
#		case $BUILD_CPU in
#			i[36]86)
#				CAN_INSTALL=yes
#			;;
#		esac
#	;;
#	x86_64)
#		case $BUILD_CPU in
#			x86_64)
#				CAN_INSTALL=yes
#			;;
#		esac
#		SANE_PATH_SEARCH="$SANE_PATH_SEARCH /usr/lib64/sane"
#	;;
#	*)
#	;;
#esac
#
#
#if test "x$CAN_INSTALL" != "xyes"; then
#	echo "This package is built for $BUILD_CPU cpu, can not install to $TARGET_CPU system"
#    exit 1
#fi
#
#
#
#################################################################################
##
## find install dir
##
#SANELIB_PATH=""
#for DIR in $SANE_PATH_SEARCH; do
#	if test -d $DIR
#	then
#		SANELIB_PATH=$DIR
#		break
#	fi
#done
#
#if test "x$SANELIB_PATH" = "x"
#then
#	echo "  Cannot find SANE lib path"
#	exit 1
#fi
#
#
#################################################################################
##
## echo informations
##
#
#echo
#echo "    start <Panasonic MFS Scanner ($BUILD_CPU)> install......"
#
#################################################################################
##
## check and execute uninstall shell script
##
#
#if test -f $INSTALL_PATH/uninstall-driver
#then
#	echo "find exist scanner driver"
#	echo "    execute uninstall shell script now......"
#	if !($INSTALL_PATH/uninstall-driver)
#	then
#		echo "    Uninstall old <Panasonic MFS Scanner Driver> failed"
#		echo "    Install driver failed"
#		echo
#		exit 1
#	fi
#fi
#
#SCRIPT=`readlink -f $0`
#SCRIPTPATH=`dirname $SCRIPT`
#PWD=`pwd`
#cd $SCRIPTPATH
#
#################################################################################
##
## echo informations
##
#
#echo "    start install files......"
#
#
#
#################################################################################
##
## sane-backend install
##
#if test -f /etc/sane.d/dll.conf
#then
#	sed -i 's/^panamfs$//' /etc/sane.d/dll.conf
#	echo "panamfs" >> /etc/sane.d/dll.conf
#fi
#
#cp ./sane-backend/panamfs.conf /etc/sane.d/panamfs.conf
#chmod 0644 /etc/sane.d/panamfs.conf
#
#cp ./sane-backend/libsane-panamfs.so.$_ver $SANELIB_PATH/libsane-panamfs.so.$_ver
#chmod 0755 $SANELIB_PATH/libsane-panamfs.so.$_ver
#
##install -m 0755 -d $INSTALL_SANE_DATA_PATH/data/cs
#mkdir -p $INSTALL_SANE_DATA_PATH/data/cs
#cp ./sane-backend/po/sane-panamfs.cs.po $INSTALL_SANE_DATA_PATH/data/cs/sane-panamfs.po
#chmod 0644 $INSTALL_SANE_DATA_PATH/data/cs/sane-panamfs.po
#
#mkdir -p $INSTALL_SANE_DATA_PATH/data/de/
#cp ./sane-backend/po/sane-panamfs.de.po $INSTALL_SANE_DATA_PATH/data/de/sane-panamfs.po
#chmod 0644 $INSTALL_SANE_DATA_PATH/data/de/sane-panamfs.po
#
#mkdir -p $INSTALL_SANE_DATA_PATH/data/en/
#cp ./sane-backend/po/sane-panamfs.en.po $INSTALL_SANE_DATA_PATH/data/en/sane-panamfs.po
#chmod 0644 $INSTALL_SANE_DATA_PATH/data/en/sane-panamfs.po
#
#mkdir -p $INSTALL_SANE_DATA_PATH/data/es/
#cp ./sane-backend/po/sane-panamfs.es.po $INSTALL_SANE_DATA_PATH/data/es/sane-panamfs.po
#chmod 0644 $INSTALL_SANE_DATA_PATH/data/es/sane-panamfs.po
#
#mkdir -p $INSTALL_SANE_DATA_PATH/data/fr/
#cp ./sane-backend/po/sane-panamfs.fr.po $INSTALL_SANE_DATA_PATH/data/fr/sane-panamfs.po
#chmod 0644 $INSTALL_SANE_DATA_PATH/data/fr/sane-panamfs.po
#
#mkdir -p $INSTALL_SANE_DATA_PATH/data/it/
#cp ./sane-backend/po/sane-panamfs.it.po $INSTALL_SANE_DATA_PATH/data/it/sane-panamfs.po
#chmod 0644 $INSTALL_SANE_DATA_PATH/data/it/sane-panamfs.po
#
#mkdir -p $INSTALL_SANE_DATA_PATH/data/ja/
#cp ./sane-backend/po/sane-panamfs.ja.po $INSTALL_SANE_DATA_PATH/data/ja/sane-panamfs.po
#chmod 0644 $INSTALL_SANE_DATA_PATH/data/ja/sane-panamfs.po
#
#mkdir -p $INSTALL_SANE_DATA_PATH/data/pl/
#cp ./sane-backend/po/sane-panamfs.pl.po $INSTALL_SANE_DATA_PATH/data/pl/sane-panamfs.po
#chmod 0644 $INSTALL_SANE_DATA_PATH/data/pl/sane-panamfs.po
#
#mkdir -p $INSTALL_SANE_DATA_PATH/data/pt/
#cp ./sane-backend/po/sane-panamfs.pt.po $INSTALL_SANE_DATA_PATH/data/pt/sane-panamfs.po
#chmod 0644 $INSTALL_SANE_DATA_PATH/data/pt/sane-panamfs.po
#
#mkdir -p $INSTALL_SANE_DATA_PATH/data/pt_PT/
#cp ./sane-backend/po/sane-panamfs.pt_PT.po $INSTALL_SANE_DATA_PATH/data/pt_PT/sane-panamfs.po
#chmod 0644 $INSTALL_SANE_DATA_PATH/data/pt_PT/sane-panamfs.po
#
#mkdir -p $INSTALL_SANE_DATA_PATH/data/ru/
#cp ./sane-backend/po/sane-panamfs.ru.po $INSTALL_SANE_DATA_PATH/data/ru/sane-panamfs.po
#chmod 0644 $INSTALL_SANE_DATA_PATH/data/ru/sane-panamfs.po
#
#mkdir -p $INSTALL_SANE_DATA_PATH/data/zh_CN/
#cp ./sane-backend/po/sane-panamfs.zh_CN.po $INSTALL_SANE_DATA_PATH/data/zh_CN/sane-panamfs.po
#chmod 0644 $INSTALL_SANE_DATA_PATH/data/zh_CN/sane-panamfs.po
#
#mkdir -p $INSTALL_SANE_DATA_PATH/data/zh_TW/
#cp ./sane-backend/po/sane-panamfs.zh_TW.po $INSTALL_SANE_DATA_PATH/data/zh_TW/sane-panamfs.po
#chmod 0644 $INSTALL_SANE_DATA_PATH/data/zh_TW/sane-panamfs.po
#
#
#ln -sf $SANELIB_PATH/libsane-panamfs.so.$_ver $SANELIB_PATH/libsane-panamfs.so.1
#ln -sf $SANELIB_PATH/libsane-panamfs.so.1 $SANELIB_PATH/libsane-panamfs.so
#
#chown root:root /etc/sane.d/panamfs.conf
#chown root:root $SANELIB_PATH/libsane-panamfs.so.$_ver
#
#chown root:root $INSTALL_SANE_DATA_PATH/data/cs/sane-panamfs.po
#chown root:root $INSTALL_SANE_DATA_PATH/data/de/sane-panamfs.po
#chown root:root $INSTALL_SANE_DATA_PATH/data/en/sane-panamfs.po
#chown root:root $INSTALL_SANE_DATA_PATH/data/es/sane-panamfs.po
#chown root:root $INSTALL_SANE_DATA_PATH/data/fr/sane-panamfs.po
#chown root:root $INSTALL_SANE_DATA_PATH/data/it/sane-panamfs.po
#chown root:root $INSTALL_SANE_DATA_PATH/data/ja/sane-panamfs.po
#chown root:root $INSTALL_SANE_DATA_PATH/data/pl/sane-panamfs.po
#chown root:root $INSTALL_SANE_DATA_PATH/data/pt/sane-panamfs.po
#chown root:root $INSTALL_SANE_DATA_PATH/data/pt_PT/sane-panamfs.po
#chown root:root $INSTALL_SANE_DATA_PATH/data/ru/sane-panamfs.po
#chown root:root $INSTALL_SANE_DATA_PATH/data/zh_CN/sane-panamfs.po
#chown root:root $INSTALL_SANE_DATA_PATH/data/zh_TW/sane-panamfs.po
#
#################################################################################
#
#
#################################################################################
##
## make install dir
##
#mkdir -p $INSTALL_PATH/
#mkdir -p $INSTALL_PATH/bin
#mkdir -p $INSTALL_PATH/conf
#mkdir -p $INSTALL_PATH/data
#
#chmod 777 $INSTALL_PATH/conf
#chmod 777 $INSTALL_PATH/data
#
#
#################################################################################
##
## Copy tool and make shortcut menu
##
#if test -d /usr/local/share/applications/
#then
#  echo ""
#else
#  mkdir -p /usr/local/share/applications
#  chown root:root /usr/local/share/applications
#  chmod 755 /usr/local/share/applications
#fi
#
#cp ./app/PanasonicMFSTools.desktop /usr/local/share/applications/PanasonicMFSTools.desktop
#chmod 0644 /usr/local/share/applications/PanasonicMFSTools.desktop
#
#cp ./app/PanasonicMFSTools $INSTALL_PATH/bin/PanasonicMFSTools
#ln -sf $INSTALL_PATH/bin/PanasonicMFSTools $INSTALL_BIN_PATH/PanasonicMFSTools
#cp ./app/PanasonicMFSTools.png $INSTALL_PATH/bin/PanasonicMFSTools.png
#chmod 0644 $INSTALL_PATH/bin/PanasonicMFSTools.png
#
#
#
#DATA_FILES=./app/res/*
#
#cp -r $DATA_FILES $INSTALL_PATH/data/
#chmod -R 777 $INSTALL_PATH/data/
#
#
#################################################################################
##
## Copy files
##
#cp ./lpd/PanasonicMFSlpd $INSTALL_PATH/bin/PanasonicMFSlpd
#cp ./server/PanasonicMFSpushd $INSTALL_PATH/bin/PanasonicMFSpushd
#cp ./killserver/killpanasonicmfspushd $INSTALL_PATH/bin/killpanasonicmfspushd
#cp ./killserver/killpanasonicmfspushd.sh $INSTALL_PATH/bin/killpanasonicmfspushd.sh
#cp ./app/PanasonicMFSscan $INSTALL_PATH/bin/PanasonicMFSscan
#cp ./uninstall/uninstall-driver $INSTALL_PATH/uninstall-driver
#cp ./Version.html $INSTALL_PATH/Version.html
#
#ln -sf $INSTALL_PATH/bin/PanasonicMFSscan $INSTALL_BIN_PATH/PanasonicMFSscan
#
#
#
#################################################################################
##
## Launch server at Login
##
#cp ./server/PanasonicMFSpushd.desktop /etc/xdg/autostart/PanasonicMFSpushd.desktop
#
#
#################################################################################
##
## Launch panalpd at start os
##
#cp ./lpd/panasoniclpd-init /etc/init.d/panasoniclpd-init
#ln -s /etc/init.d/panasoniclpd-init /etc/rc2.d/S80panasoniclpd-init
#ln -s /etc/init.d/panasoniclpd-init /etc/rc3.d/S80panasoniclpd-init
#ln -s /etc/init.d/panasoniclpd-init /etc/rc4.d/S80panasoniclpd-init
#ln -s /etc/init.d/panasoniclpd-init /etc/rc5.d/S80panasoniclpd-init
#
#
#if test -f /etc/gdm/PostSession/Default
#then
#	sed -i "s|^$INSTALL_PATH/bin/killpanasonicmfspushd$||" /etc/gdm/PostSession/Default
#	echo "$INSTALL_PATH/bin/killpanasonicmfspushd" >> /etc/gdm/PostSession/Default
#
#	sed -i 's/^killall PanasonicMFSpushd$//' /etc/gdm/PostSession/Default
#	echo "killall PanasonicMFSpushd" >> /etc/gdm/PostSession/Default
#
#	sed -i 's|^rm /var/tmp/com.panasonic.mfs.killserver.lock$||' /etc/gdm/PostSession/Default
#	echo "rm /var/tmp/com.panasonic.mfs.killserver.lock" >> /etc/gdm/PostSession/Default
#
#	sed -i 's/^exit 0$//' /etc/gdm/PostSession/Default
#	echo "exit 0" >> /etc/gdm/PostSession/Default
#fi
#
#
#if test -f /etc/lightdm/lightdm.conf
#then
#	CLEANSCRIPT=`grep session-cleanup-script= /etc/lightdm/lightdm.conf`
#
#	if test "x$CLEANSCRIPT" = "x"
#	then
#		sed -i "/\[SeatDefaults\]/a\session-cleanup-script=$INSTALL_PATH/bin/killpanasonicmfspushd.sh" /etc/lightdm/lightdm.conf
#	fi
#fi
#
#
#cd $PWD
#
#################################################################################
##
## start 
##
#
##echo " start panasoniclpd"
##if test -f /etc/init.d/pushscan-init
##then
##	/etc/init.d/pushscan-init start
##fi
#
#$INSTALL_PATH/bin/PanasonicMFSlpd  > /dev/null 2>&1 &
#if test "x$SUDO_USER" != "x"
#then
#	sudo -u $SUDO_USER $INSTALL_PATH/bin/PanasonicMFSpushd  > /dev/null 2>&1 &
#else
#	if test "x$LOGNAME" != "x"
#	then
#		sudo -u $LOGNAME $INSTALL_PATH/bin/PanasonicMFSpushd  > /dev/null 2>&1 &
#	fi
#fi
#
#
#
#
#################################################################################
##
## echo informations
##
#
#echo
#echo "    Install driver completed"
#echo
#
#
#exit 0
#
#}
