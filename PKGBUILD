# Maintainer: Daniel Kutka  <dano.kutka@gmail.com>

pkgname=qqc2-suru-style-git
_pkgname=qqc2-suru-style
pkgver=5.12
pkgrel=4
pkgdesc="Suru style for QtQuick Controls 2"
arch=('x86_64' 'armv7' 'aarch64')
url="https://github.com/ubports/qqc2-suru-style.git"
license=('GPL3')
depends=(qt5-base qt5-declarative qt5-quickcontrols2)
makedepends=('git')
provides=(qqc2-suru-style)
conflicts=(qqc2-suru-style)
source=('git+https://github.com/dano6/qqc2-suru-style.git#branch=5.12-fixes')
md5sums=('SKIP')

prepare() {
  mkdir -p build
  cd ${_pkgname}
}

build() {
  cd ${_pkgname}
  qmake CONFIG+=no_docs
  make
}

package() {
  cd ${_pkgname}
  make INSTALL_ROOT="${pkgdir}/" install
}
