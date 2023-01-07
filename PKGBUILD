# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=fleng
pkgver=12
pkgrel=1
pkgdesc="A low level concurrent logic programming language descended from Prolog"
arch=('x86_64')
url="http://www.call-with-current-continuation.org/fleng/fleng.html"
license=("Public Domain")
depends=()
makedepends=('gcc' 'make' 'gprolog')
source=(http://www.call-with-current-continuation.org/fleng/fleng-${pkgver}.tgz)
sha256sums=('d9eefcadf94dacc4fd382238e4c8e9e56563a7098f263a454836397f82ad7f65')
internal="d7a6555"

build() {
    cd $srcdir/fleng-$pkgver-$internal
    LDFLAGS="-lm"  ./configure
    make
}

check() {
    cd $srcdir/fleng-$pkgver-$internal
    make check
}

package() {
    cd $srcdir/fleng-$pkgver-$internal
    make DESTDIR=$pkgdir install
}
