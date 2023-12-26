# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=kx3utility
_pkgname=KX3UtilityLINUX64BIT
pkgver=1_23_4_23
pkgrel=1
pkgdesc="Elecraft Factory APP for use with the KX3 Ham Radio."
arch=('x86_64')
url="https://elecraft.com/pages/kx3-hand-held-5-band-cw-transceiver-firmware-and-utility"
license=('custom:ELECRAFT')
depends=('gcc-libs' 'gtk2' 'curl' 'hamradio-menus')
options=('!strip')
source=(https://ftp.elecraft.com/KX3/Utilities/${_pkgname}_$pkgver.tar.gz
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
	install -D -m 644 Resources/icon-48.png $pkgdir/usr/share/pixmaps/kx3utility.png
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('f46a2786b81bcb82d874c9e5c00427ac'
         'f4b373e99d2a8f95808215b4025db0df'
         'de0447372391b050565d14ea21aa4b70')
sha256sums=('8f5fca7e8c192ad3cacdda5cf75cf07492abaa72f85dcbbc889977d8e46125fa'
            '40343738556bddf99f2a7bdce874433acd8253c1f392f5074bccd15b166ae7cc'
            '5647d6082ebe8109899c550b9f991d8709cb7be7b20ee3596e4bad2bee794aed')
