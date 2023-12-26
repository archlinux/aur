# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=px3utility
_pkgname=PX3UtilityLINUX64BIT
__pkgname=PX3UtilityLINUX
pkgver=1_19_9_6
pkgrel=1
pkgdesc="Elecraft Factory APP for use with the PX3 Panadapter - Ham Radio."
arch=('x86_64')
url="https://elecraft.com/pages/px3-high-performance-portable-panadapter-firmware-and-utility"
license=('custom:ELECRAFT')
depends=('gcc-libs' 'gtk2' 'curl' 'hamradio-menus')
options=('!strip')
source=(https://ftp.elecraft.com/PX3/Utilities/${_pkgname}_$pkgver.tar.gz
	$pkgname.1
	$pkgname.desktop)

package() {
	cd $srcdir/${__pkgname}_$pkgver

	install -d $pkgdir/usr/share/$pkgname
	cp -a * $pkgdir/usr/share/$pkgname

	mkdir -p $pkgdir/usr/bin
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps,licenses/$pkgname}
	install -D -m 644 Help/License.rtf $pkgdir/usr/share/licenses/$pkgname
	install -D -m 644 Resources/icon-48.png $pkgdir/usr/share/pixmaps/px3utility.png
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('4858b2c0124c18430b8f7486168494a0'
         '3e681e60fda5c92cc0ba5673077f2811'
         'fa21378c8b9b9623ea40f46d8c6247a2')
sha256sums=('a963992901028e42bf41457f642425d89d76ab0cfb52513c93128033c9e75c17'
            'f971033dde2112cf95c4e4f961eae1aa65cf5d62a47184968ea64cfc54d91a20'
            '075be249b83cd2294fdf73243cf0a1cc0fa62f7edc353185a7503479532f2d4c')
