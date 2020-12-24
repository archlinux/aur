pkgname=gnucobol
pkgver=3.1.2
pkgdesc="A free, open source and modern COBOL compiler"
pkgrel=1
arch=("x86_64")
url="https://www.gnu.org/software/gnucobol/"
license=("GPL")
depends=("db" "gmp")
makedepends=("gcc")
options=("!libtool")
source=(
	"https://ftp.gnu.org/gnu/gnucobol/$pkgname-$pkgver.tar.xz"
	"https://ftp.gnu.org/gnu/gnucobol/$pkgname-$pkgver.tar.xz.sig"
)
sha256sums=(
	"597005d71fd7d65b90cbe42bbfecd5a9ec0445388639404662e70d53ddf22574"
	"SKIP"
)
validpgpkeys=(
	"B9459D0CA8A740B323235CDF13E96B53C005604E"
)

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr --infodir=/usr/share/info
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

