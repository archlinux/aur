# Maintainer: Tianhao Wang <i AT shrik3 DOT com>
#
pkgname=vodozemac-bindings-cpp-kazv
pkgver=0.1.0
pkgrel=1
pkgdesc="kazv's C++ bindings for the vodozemac cryptographic library."
arch=('x86_64')
url="https://lily-is.land/kazv/vodozemac-bindings"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepend=('rust')
source=("https://lily-is.land/kazv/vodozemac-bindings/-/archive/v${pkgver}/vodozemac-bindings-v${pkgver}.tar.gz")
sha512sums=('SKIP')
provides=("libvodozemac.so=0.1.0" 'libvodozemac.so')

_pkgname=vodozemac-bindings-v$pkgver
build() {
    cd "$srcdir"/$_pkgname
    make -C cpp
}

package() {
    cd "$srcdir"/$_pkgname
    make -C cpp PREFIX="$pkgdir/usr" install
}
