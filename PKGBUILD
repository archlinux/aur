# Contributor: Anton Leontiev <scileont /at/ t-25.ru>
pkgname=gwydump
pkgver=2.1
pkgrel=2
pkgdesc='A small program to dump Gwyddion .gwy file structure in a human-readable text format'
url='http://gwyddion.net/gwydump.php'
license=('GPL')
arch=('i686' 'x86_64')
depends=('glib2')
source=(http://downloads.sourceforge.net/project/gwyddion/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz)
md5sums=('a7bff369b5d8c07974b99b480ff46f01')

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver

	# Syntax of pkg-config has changed
	sed -i -e 's/--prefix/--variable=prefix/' Makefile
	make DESTDIR="$pkgdir" install
}
