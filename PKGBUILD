# Maintainer: Martchus <martchus@gmx.net>
pkgname=qtutilities
pkgver=3.0.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Common Qt related C++ classes and routines used by my
 applications such as dialogs, widgets and models."
license=('GPL')
depends=('c++utilities' 'qt5-base')
makedepends=
url="https://github.com/Martchus/qtutilities"
source=("qtutilities-${pkgver}.tar.gz::https://github.com/Martchus/qtutilities/archive/v${pkgver}.tar.gz")
_reponame=qtutilities
sha256sums=('7d2aae83ffc116d955e880beb0be3fa90913ae2fb42039394dc1855f99b8d10d')

build() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    INSTALL_ROOT=$pkgdir/usr/ qmake-qt5 "$pkgname.pro"
    make
}

package() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    make install
}

