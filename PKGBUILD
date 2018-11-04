# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=qtutilities
pkgname=qtutilities
pkgver=5.12.0
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Common Qt related C++ classes and routines used by my applications such as dialogs, widgets and models'
license=('GPL')
depends=('c++utilities' 'qt5-base')
makedepends=('cmake' 'qt5-tools' 'mesa')
optdepends=("$pkgname-doc: API documentation")
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('ded9aa4b40076aa5eb2d09c87207cebd218e42c4199a21bc2530fefb882e1408')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
