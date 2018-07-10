# $Id$
# Maintainer: lxz <lxz@ilxz.me>

pkgname=deepin-network-utils
pkgver=0.0.0
pkgrel=2
pkgdesc="Deepin network utils"
arch=('x86_64')
url="https://github.com/linuxdeepin/dde-network-utils"
license=('GPL3')
groups=('deepin')
makedepends=('git')
source=("${pkgname}"::'git+https://github.com/linuxdeepin/dde-network-utils.git')
sha512sums=('SKIP')

build() {
  cd ${pkgname}
  git checkout 59572797c2733ddc275c8dc3280f8ac3cdbb2048
  qmake
  make -j4
}

package() {
  cd ${pkgname}
  make INSTALL_ROOT="${pkgdir}" install
}
