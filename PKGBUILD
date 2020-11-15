pkgname=gnucobol
pkgver=3.1
pkgdesc="A free, open source and modern COBOL compiler"
pkgrel=1
arch=("x86_64")
url="https://www.gnu.org/software/gnucobol/"
license=("GPL")
depends=("db" "gmp")
makedepends=("gcc" "help2man")
options=("!libtool")
source=(
	"https://ftp.gnu.org/gnu/gnucobol/$pkgname-$pkgver.tar.xz"
	"https://ftp.gnu.org/gnu/gnucobol/$pkgname-$pkgver.tar.xz.sig"
)
sha256sums=(
	"28890804ada74dee1433b5c46f6774ce9740edd2ba047443c3e634217fa0c21a"
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

