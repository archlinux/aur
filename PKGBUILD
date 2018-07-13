# $Id$
# Maintainer: Haruyuki lxz <lxz@ilxz.me>

pkgname=dtkwidget-git
pkgver=2.0.8.1.r1.870cf29
pkgrel=1
pkgdesc='Deepin graphical user interface library'
arch=('x86_64')
url="https://github.com/linuxdeepin/dtkwidget"
license=('GPL3')
depends=('deepin-qt-dbus-factory' 'dtkcore' 'librsvg' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras'
         'startup-notification')
makedepends=('qt5-tools')
provides=('dtkwidget')
replaces=('deepin-tool-kit')
conflicts=('deepin-tool-kit<0.3.4' 'dtkwidget')
options=('debug')
source=("git+https://github.com/linuxdeepin/dtkwidget.git")
sha512sums=('SKIP')

build() {
  cd dtkwidget
  git checkout 870cf29
  LDFLAGS=${LDFLAGS/,-z,now/}
  qmake-qt5 PREFIX=/usr
  make -j4
}

package() {
  cd dtkwidget
  make INSTALL_ROOT="$pkgdir" install
}
