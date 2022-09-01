# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=fleng
pkgver=10
pkgrel=1
pkgdesc="A low level concurrent logic programming language descended from Prolog"
arch=('x86_64')
url="http://www.call-with-current-continuation.org/fleng/fleng.html"
license=("Public Domain")
depends=()
makedepends=('gcc' 'make' 'gprolog')
source=(http://www.call-with-current-continuation.org/fleng/fleng-${pkgver}.tgz)
sha256sums=('3773970f2d3a12aa137850d16969fb0fb107906950f10e21f8c61755a3534855')

build() {
    cd $srcdir/fleng-$pkgver-e137946
    ./configure
    make
}

check() {
    cd $srcdir/fleng-$pkgver-e137946
    make check
}

package() {
    cd $srcdir/fleng-$pkgver-e137946
    touch INTERNALS
    make DESTDIR=$pkgdir install
}
