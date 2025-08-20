pkgname=httpc
pkgver=1.3.0
pkgrel=1
pkgdesc='A Simple zero-conf http 1.1 server to use instead of the python http.server'
arch=('x86_64')
url='https://github.com/Evilur/httpc'
license=('MIT')
source=("https://github.com/Evilur/httpc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('57d48a80c1019e6b2f3f9dad6ce3af8405312c28c668f3495e3303c918f4af119a7c7b9b7f1af35dd30e217448e8ff1c190fa88276d59d9d04cddefe3a7f7f82')
sha256sums=('679011e642ae7e5dfd5d4f12890155253396dfb8b0ec04c036cdbe36aaa46000')
makedepends=('make' 'gcc')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 bin/httpc "$pkgdir/usr/bin/httpc"
}