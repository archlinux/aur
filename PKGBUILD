# Maintainer: Hugo Courtial <hugo [at] courtial [not colon] me>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=seexpr1
pkgver=1.0.1
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="First release of SeExpr, a simple expression language"
url="https://github.com/wdas/SeExpr/tree/rel-1.0.1"
license=("Apache")
conflicts=("seexpr-git")
makedepends=('cmake' 'qt4')
depends=('libpng' 'gcc-libs-multilib')
source=("https://github.com/wdas/SeExpr/archive/rel-1.0.1.tar.gz")
sha512sums=("3e6780c479d812b999fd51f1afe99117b073a70807405af9f1afe382eae11c8f958aef6f2ee1d4fddb9162158c11a87e4d045436443bd8aa5c7b7fd415a92167")

build() {
    cd "$srcdir/SeExpr-rel-1.0.1"
    cmake -D CMAKE_INSTALL_PREFIX=$pkgdir/usr/ .
    make
}

package() {
    cd "$srcdir/SeExpr-rel-1.0.1"
    make install
    rm -R $pkgdir/usr/test
    rm -R $pkgdir/usr/demo
}
