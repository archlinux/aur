# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=kh1utility
_pkgname=KH1UtilityLINUX64BIT
pkgver=1_24_6_2
pkgrel=1
pkgdesc="Elecraft Factory APP for use with the KH1 Ham Radio."
arch=('x86_64')
url="https://elecraft.com/pages/kh1-hand-held-5-band-cw-transceiver-firmware-and-utility"
license=('custom:ELECRAFT')
depends=('gcc-libs' 'gtk2' 'curl' 'hamradio-menus')
options=('!strip')
source=(https://ftp.elecraft.com/KH1/Utilities/${_pkgname}_$pkgver.tar.gz
	$pkgname.1
	$pkgname.desktop)

package() {
	cd $srcdir/${_pkgname}_$pkgver

	install -d $pkgdir/usr/share/$pkgname
	cp -a * $pkgdir/usr/share/$pkgname

	mkdir -p $pkgdir/usr/bin
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps,licenses/$pkgname}
	install -D -m 644 Help/License.rtf $pkgdir/usr/share/licenses/$pkgname
	install -D -m 644 Resources/icon-48.png $pkgdir/usr/share/pixmaps/kh1utility.png
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('3b61f55edd302e0b2a9fad03507004f1'
         '30cc5c211138ce078c087cecaafdfafd'
         '0afe198b2a69e1cb53209f8e5e2cf499')
sha256sums=('a33dc969e0e1ca7682617ff05fdde2c7a9524d870590a62ef827c7430b7e1900'
            'a35c08dee98395eb599ebb43f38bc1bbf9d313878bcec2182609ebfa773067e3'
            'ca6378b792d366b5d4f76add9da7be8bb20ca5fa2b068965ddf38ec9109ad086')
