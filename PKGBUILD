pkgname=gnucobol
pkgver=3.1rc1
_tarver="3.1-rc1"
pkgdesc="A free, open source and modern COBOL compiler"
pkgrel=1
arch=("x86_64")
url="https://www.gnu.org/software/gnucobol/"
license=("GPL")
depends=("db" "gmp")
makedepends=("gcc" "help2man")
options=("!libtool")
source=(
	"https://alpha.gnu.org/gnu/gnucobol/$pkgname-$_tarver.tar.xz"
	"https://alpha.gnu.org/gnu/gnucobol/$pkgname-$_tarver.tar.xz.sig"
)
sha256sums=(
	"c2e41c2ba520681a67c570d7246d25c31f7f55c8a145aaec3f6273a500a93a76"
	"SKIP"
)
validpgpkeys=(
	"B9459D0CA8A740B323235CDF13E96B53C005604E"
)

build() {
	cd "$srcdir/$pkgname-$_tarver"

	./configure --prefix=/usr --infodir=/usr/share/info
	make
}

package() {
	cd "$srcdir/$pkgname-$_tarver"
	make DESTDIR="$pkgdir" install
}

