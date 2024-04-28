# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=meteo-qt
pkgname=$_pkgname-git
pkgver=3.3.3.gd21bdba
pkgrel=2
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL-3.0-only')
depends=('python-lxml' 'python-pyqt5' 'python-urllib3')
makedepends=('git' 'python-setuptools' 'qt5-tools')
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

