# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=editcp
pkgver=0.14.3
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
md5sums=('bb44786eeb4ea232b0d1f4b2dac99d5e'
         'd8563d34bd6be7d13a9137f8f80b86e2'
         '188b84c0e898c1676d0c68f477bf3a38'
         '6c9b1f8f43dedb505699b4648cc558a5'
         '1cb585e3e2a4f1f6fc7a2fcb139bc6d4')
sha256sums=('012a6c67178547545b0fba97eaff51aeb30b209a36c8481091ff62cd0e123775'
            'f219b7708dc3d749b174cba8a0e5a466b7086ae36dd296050b1bb48fcce10107'
            '67a26f228506aca303cf1170a7612d9c18d7713ec88cc48f4653c9748227fc34'
            '9822a5e7f7fc179c6a1b98f5886797d91dd0d0d82e465a0a812e445539e9f2f4'
            '66b78e446e7580ffca6a84b4335bcad6a689faeb6910f61a9ef9951ebc4174b4')
