# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=xg3utility
_pkgname=XG3UtilityLINUX64BIT
__pkgname=XG3UtilityLINUX
pkgver=19_9_6
pkgrel=1
pkgdesc="Elecraft Factory APP for use with the XG3 Generator - Ham Radio."
arch=('x86_64')
url="https://ftp.elecraft.com/XG3/Manuals%20Downloads/"
license=('custom:ELECRAFT')
depends=('gcc-libs' 'gtk2' 'curl' 'hamradio-menus')
options=('!strip')
source=(https://ftp.elecraft.com/XG3/Utilities/${_pkgname}_$pkgver.tar.gz
	$pkgname.1
	$pkgname.desktop)

package() {
	cd $srcdir/${__pkgname}_$pkgver

	install -d $pkgdir/usr/share/$pkgname
	cp -a * $pkgdir/usr/share/$pkgname

	mkdir -p $pkgdir/usr/bin
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps,licenses/$pkgname}
	install -D -m 644 Help/XG3UtilityLicense.rtf $pkgdir/usr/share/licenses/$pkgname
	install -D -m 644 Resources/icon-48.png $pkgdir/usr/share/pixmaps/xg3utility.png
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications

	chmod 644 $pkgdir/usr/share/$pkgname/Help/*
}
md5sums=('9cfe876d6e1220d29ee22e1904e1fd98'
         '9b109dc79ad4195f9a937f0482cb4324'
         '1aed68a5d4c8631f0027156eaebe62a3')
sha256sums=('f0592a133d0e86fccf57413c89e096f8207a983a7a10aa9b49745d382c75df1e'
            'de9c77223d69dbbf2d5fc451a3128dd53dcf326cee577cb9b2340e22367e5cc1'
            '3b08d63227279cd82d0703dfcc7f66cfa1d5b3a7f28c188b13672f1460fb7563')
