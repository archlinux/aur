pkgname=gnucobol
pkgver=3.0rc1
_tarver="3.0-rc1"
pkgdesc="The open source GNU COBOL compiler"
pkgrel=1
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/open-cobol/"
license=("GPL")
depends=("db" "gmp")
makedepends=("gcc" "help2man")
options=("!libtool")
source=("$pkgname-$pkgver.tar.xz"::"http://sourceforge.net/projects/open-cobol/files/$pkgname/3.0/$pkgname-$_tarver.tar.xz")
sha256sums=("bf76441ee7f8dc9aeb78291231f32273eafc4ec827f26840846a257a04bbc594")

build() {
	cd "$srcdir/$pkgname-$_tarver"

	./configure --prefix=/usr --infodir=/usr/share/info
	make
}

package() {
	cd "$srcdir/$pkgname-$_tarver"
	make DESTDIR="$pkgdir" install
}

