# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=libzia3
pkgver=3.28
pkgrel=1
pkgdesc="Support lib. for tucnak3"
arch=('i686' 'x86_64')
url="http://tucnak.nagano.cz/"
license=('GPL')
depends=('sdl' 'gtk2' 'libusb-compat')
makedepends=('libftdi-compat' 'pkg-config')
source=("http://tucnak.nagano.cz/libzia3-3.28.tar.gz"
	diff.zbfd.c
	diff.zdump.c)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.zbfd.c
	patch -p0 < ../diff.zdump.c
}

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR=$pkgdir install
}
md5sums=('fc5892fa15d9c8c61b7072de235f31e5'
         '89c0df530740b443ecb9a81fcd56b290'
         '2605f7404324ff64c78d539e37dc3a8a')
sha256sums=('2f5f217dd73c2a65bfc9cab4e7bd31054ed580f36570b7ad29e9be23be3b0c84'
            'd7e847934c40ce192ff949c0aa33b2ddf252310d11ade4fbbbd21f47e00c1301'
            '414064189562c05a5d600ead106f77348db4dccc73dc4a3a1b103075befe96ed')
