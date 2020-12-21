# Maintainer: Furkan Kardame <furkan@fkardame.com>

pkgname=qqc2-suru-style-git
_pkgname=qqc2-suru-style
pkgver=5.12
pkgrel=1
pkgdesc="Suru style for QtQuick Controls 2"
arch=('x86_64' 'armv7' 'aarch64')
url="https://github.com/ubports/qqc2-suru-style.git"
license=('GPL3')
depends=(qt5-base qt5-declarative qt5-quickcontrols2)
makedepends=('git')
source=('git+https://github.com/ubports/qqc2-suru-style.git#branch=xenial_-_qt-5-12')
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
