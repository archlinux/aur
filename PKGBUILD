# Maintainer: Martchus <martchus@gmx.net>
_reponame=qtutilities
pkgname=qtutilities
pkgver=3.1.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Common Qt related C++ classes and routines used by my applications such as dialogs, widgets and models."
license=('GPL')
depends=('c++utilities' 'qt5-base')
makedepends=('cmake')
url="https://github.com/Martchus/${_reponame}"
source=("qtutilities-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('e2c9816aa82ea98004437503b52b4b64cec56fc7fd4bd2a649d998a2d1a2cf8d')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make install
}

