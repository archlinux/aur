# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=meteo-qt
pkgname=$_pkgname-git
pkgver=0.8.1.13.g886e154
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('libxkbcommon-x11' 'python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('python' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/dglent/meteo-qt.git')
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed "s/^v//;s/-/./g"
}

package() {
  cd $_pkgname
  python setup.py install --root $pkgdir
}
