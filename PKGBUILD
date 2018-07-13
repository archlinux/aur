# $Id$
# Maintainer: Haruyuki lxz <lxz@ilxz.me>

pkgname=dtkcore-git
pkgver=2.0.8.1.r1.57ec78b
pkgrel=1
pkgdesc='DTK core modules'
arch=('x86_64')
url="https://github.com/linuxdeepin/dtkcore"
license=('GPL3')
depends=('deepin-qt-dbus-factory' 'dtkcore' 'librsvg' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras'
         'startup-notification')
provides=('dtkcore')
makedepends=('qt5-tools')
replaces=('deepin-tool-kit')
conflicts=('deepin-tool-kit<0.3.4' 'dtkcore')
options=('debug')
source=("git+https://github.com/linuxdeepin/dtkcore.git")
sha512sums=('SKIP')

build() {
  cd dtkcore
  git checkout 57ec78b
  LDFLAGS=${LDFLAGS/,-z,now/}
  qmake-qt5 PREFIX=/usr
  make -j4
}

package() {
  cd dtkcore
  make INSTALL_ROOT="$pkgdir" install
}
