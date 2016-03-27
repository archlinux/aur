# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_pkgfqdn=qtquickcontrols2
pkgname=hawaii-qt5-quickcontrols2
pkgver=5.6.0
pkgrel=1
pkgdesc="A cross-platform application and UI framework (Qt Labs Controls)"
arch=('i686' 'x86_64' 'armv6hl' 'armv7hl')
url="http://qt.io/"
license=('GPL3' 'LGPL')
depends=('qt5-base' 'qt5-declarative')
provides=('qt5-quickcontrols2')
conflicts=('qt5-quickcontrols2' 'hawaii-qt5-quickcontrols2-git')
replaces=('qt5-quickcontrols2')
makedepends=('git' 'gdb')
makedepends=('git' 'gdb')
options=('!libtool' 'debug')
source=("http://download.qt-project.org/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqdn}-opensource-src-${pkgver}.tar.xz")
sha1sums=('06491bace7bcf1af0723e4d83f736dcd4a5778b4')

build() {
  cd ${_pkgfqdn}-opensource-src-${pkgver}
  qmake
  make
}

package() {
  cd ${_pkgfqdn}-opensource-src-${pkgver}
  make INSTALL_ROOT="${pkgdir}" install
}
