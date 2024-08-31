# Maintainer: Mike Pento <mpento@darkforge.net> 

pkgname=sonar-icon-theme
pkgver=11.3.1.79.7
realver=11.3.1-79.7
pkgrel=1
pkgdesc="Icon theme from Suse 11.3 (tecnically from factory), based on the default gnome 3.0.0 icon theme."
arch=('any')
url="http://www.opensuse.org"
license=('GPL3')
provides=('icon-theme-sonar' 'sonar-icon-theme')
optdepends=('gnome-icon-theme: For correct integration into the desktop')
makedepends=('rpmextract')
source=("https://download.opensuse.org/repositories/GNOME:/Factory/openSUSE_Factory/noarch/$pkgname-$realver.noarch.rpm")
sha256sums=('4a29e02f58ff059a4c150873712f3a024d93ef915cf668849cb927f6756f2a60')

build(){
	cd $srcdir
	rpmextract.sh $srcdir/$pkgname-$realver.noarch.rpm
}

package(){
	cp -dprv --no-preserve=ownership $srcdir/usr $pkgdir/
	cp -dprv --no-preserve=ownership $pkgdir/usr/share/doc/packages/$pkgname $pkgdir/usr/share/doc/$pkgname
	rm -fr $pkgdir/usr/share/doc/packages
	cd $pkgdir/usr/share/icons/Sonar
	#for i in 16x16 22x22 24x24 32x32 48x48;do
	#	rm $i/places/gnome-main-menu.png\
	#	$i/places/novell-button.png\
	#	$i/places/start-here.png\
	#	$i/places/distributor-logo.png
	#done;
	for j in 16x16 22x22 24x24 32x32 48x48 256x256;do
		cp -dprv --no-preserve=ownership $j/apps/notification-properties.png $j/apps/xfce4-notifyd.png

		cp -dprv --no-preserve=ownership $j/apps/ooo-base.png $j/apps/libreoffice-base.png
		cp -dprv --no-preserve=ownership $j/apps/ooo-calc.png $j/apps/libreoffice-calc.png
		cp -dprv --no-preserve=ownership $j/apps/ooo-draw.png $j/apps/libreoffice-draw.png
		cp -dprv --no-preserve=ownership $j/apps/ooo-gulls.png $j/apps/libreoffice-main.png
		cp -dprv --no-preserve=ownership $j/apps/ooo-gulls.png $j/apps/libreoffice-startcenter.png
		cp -dprv --no-preserve=ownership $j/apps/ooo-impress.png $j/apps/libreoffice-impress.png
		cp -dprv --no-preserve=ownership $j/apps/ooo-web.png $j/apps/libreoffice-web.png
		cp -dprv --no-preserve=ownership $j/apps/ooo-writer.png $j/apps/libreoffice-writer.png

		cp -dprv --no-preserve=ownership $j/apps/ooo-web.png $j/apps/internet-mail.png

		cp -dprv --no-preserve=ownership $j/places/folder-download.png $j/places/folder-downloads.png

		cp -dprv --no-preserve=ownership $j/devices/computer.png $j/devices/chardevice.png
		cp -dprv --no-preserve=ownership $j/devices/computer.png $j/devices/video-display.png
		cp -dprv --no-preserve=ownership $j/devices/computer.png $j/devices/xfce4-display.png
	done
}

# vim: ts=2 sw=2 et:
