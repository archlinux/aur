# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=meteo-qt
pkgname=$_pkgname-git
pkgver=3.1.10.g0a83f51
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('python-lxml' 'python-pyqt5' 'python-sip4' 'python-urllib3')
makedepends=('git' 'qt5-tools')
optdepends=('qt5-translations: translations of some native UI components')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed "s/^v//;s/-/./g"
}

package() {
  cd $_pkgname
  python setup.py install --root $pkgdir
}

