# $Id$
# Maintainer: Haruyuki lxz <lxz@ilxz.me>

pkgname=deepin-network-utils-git
pkgver=0.0.1.r1.15f6cf0
pkgrel=1
pkgdesc="Deepin network utils"
arch=('x86_64')
url="https://github.com/linuxdeepin/dde-network-utils"
license=('GPL3')
groups=('deepin')
provides=('deepin-network-utils')
confticts=('deepin-network-utils')
makedepends=('git')
source=("${pkgname}"::'git+https://github.com/linuxdeepin/dde-network-utils.git')
sha512sums=('SKIP')

build() {
  cd ${pkgname}
  git checkout 15f6cf0
  qmake
  make -j4
}

package() {
  cd ${pkgname}
  make INSTALL_ROOT="${pkgdir}" install
}
