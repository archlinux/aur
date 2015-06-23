# Maintainer: Simon Kohlmeyer <simon dot kohlmeyer at gmail dot com>
pkgname=valsort
pkgver=1.5
pkgrel=1
pkgdesc="Validate sorted records for the sort benchmarks presented on www.sortbenchmark.org"
arch=('i686', 'x86_64')
url="http://www.ordinal.com/gensort.html"
license=('GPL2')
depends=('zlib')
source=(http://www.ordinal.com/try.cgi/gensort-$pkgver.tar.gz)
sha256sums=('7f7573783d8298cef3dd4aa1db8225c914de1a0cfed283965ea20b69838a67ad')

build() {
	cd "$srcdir/gensort-$pkgver"
	make
}

check() {
	cd "$srcdir/gensort-$pkgver"
    test -x $pkgname
}

package() {
	cd "$srcdir/gensort-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    cp $pkgname "$pkgdir/usr/bin/"
}
