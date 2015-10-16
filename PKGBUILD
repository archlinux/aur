# Maintainer: Martchus <martchus@gmx.net>
pkgname=c++utilities
pkgver=3.0.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Common C++ classes and routines used by my applications such
as argument parser, IO and conversion utilities."
license=('GPL')
depends=('gcc-libs')
makedepends=('qt5-base')
url="https://github.com/Martchus/cpp-utilities"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/cpp-utilities/archive/v${pkgver}.tar.gz")
_reponame=cpp-utilities
sha256sums=('6de9cb9d9d2af191be79652590d5a23dfaa886c5384c59e7227508542d764dff')

build() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    INSTALL_ROOT=$pkgdir/usr/ qmake-qt5 "$pkgname.pro"
    make
}

package() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    make install
}
