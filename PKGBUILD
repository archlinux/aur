# Maintainer: Martchus <martchus@gmx.net>
pkgname=c++utilities
pkgver=2.0.1
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Common C++ classes and routines used by my applications such
as argument parser, IO and conversion utilities."
license=('GPL')
depends=('gcc-libs')
makedepends=('qt5-base')
url="https://github.com/Martchus/cpp-utilities"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/cpp-utilities/archive/v${pkgver}.tar.gz")
_reponame=cpp-utilities
sha256sums=('13cd2a9fb394d0da7656880adb1e358fc40f1b4860f77fd64970c4d00f70b05f')

build() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    INSTALL_ROOT=$pkgdir/usr/ qmake-qt5 "$pkgname.pro"
    make -j 4
}

package() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    make install
}
