# Maintainer: Martchus <martchus@gmx.net>
pkgname=c++utilities
pkgver=2.0.2
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Common C++ classes and routines used by my applications such
as argument parser, IO and conversion utilities."
license=('GPL')
depends=('gcc-libs')
makedepends=('qt5-base')
url="https://github.com/Martchus/cpp-utilities"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/cpp-utilities/archive/v${pkgver}.tar.gz")
_reponame=cpp-utilities
sha256sums=('41dfde4b9e86c787cc93495508d017bdf490d6e93793c756e284d52ef340207d')

build() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    INSTALL_ROOT=$pkgdir/usr/ qmake-qt5 "$pkgname.pro"
    make
}

package() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    make install
}
