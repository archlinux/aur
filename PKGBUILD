# Maintainer: Hugo Courtial <hugo [at] courtial [not colon] me>
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
md5sums=("e67e6e677958ba036dd9f18cd0c7ebaa")

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
