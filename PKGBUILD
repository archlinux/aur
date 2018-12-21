# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=editcp
pkgver=1.0.6
pkgrel=1
pkgdesc="TYT MD380/390, Retivis RT3, & Alinco DJ-MD40 CPS (Ham/Amateur Radio)"
arch=('x86_64')
url="https://www.farnsworth.org/dale/codeplug/editcp/"
license=('GPL3')
depends=('qt5ct' 'qt5-multimedia' 'qt5-location' 'qt5-tools' 'gtk3'\
 'libmariadbclient' 'postgresql-libs' 'hamradio-menus')
install=editcp.install
source=(https://www.farnsworth.org/dale/codeplug/editcp/downloads/\
linux/$pkgname-$pkgver.tar.xz
https://github.com/DaleFarnsworth/codeplug/raw/master/editcp/logo/editcp_32x32_01.png
	diff.editcp.sh
	$pkgname.1
        $pkgname.desktop)

prepare () {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.editcp.sh
}

package() {
	cd $srcdir/$pkgname-$pkgver

	install -d $pkgdir/usr/share/$pkgname

	cp -a * $pkgdir/usr/share/$pkgname

	mkdir -p $pkgdir/usr/bin
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 ../${pkgname}_32x32_01.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -D -m 644 ../$pkgname.desktop \
	 $pkgdir/usr/share/applications/.
}
md5sums=('62529ed561814fb8db08ff4d4a5f4305'
         'd8563d34bd6be7d13a9137f8f80b86e2'
         '66f7cbc8cb62f9d95d8dc9924c728363'
         '6c9b1f8f43dedb505699b4648cc558a5'
         '1cb585e3e2a4f1f6fc7a2fcb139bc6d4')
sha256sums=('f6f2000f0ea648f59d7f699d3ff1f87b48ecb6910b505524939418930cec6ae7'
            'f219b7708dc3d749b174cba8a0e5a466b7086ae36dd296050b1bb48fcce10107'
            'fc150f7779a66a717b838770f62eb3d3343f6b123a34f3300070af0f70b538c5'
            '9822a5e7f7fc179c6a1b98f5886797d91dd0d0d82e465a0a812e445539e9f2f4'
            '66b78e446e7580ffca6a84b4335bcad6a689faeb6910f61a9ef9951ebc4174b4')
