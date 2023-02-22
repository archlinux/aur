# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=taurus
pkgname=python-$_name
pkgver=5.1.5
pkgrel=1
pkgdesc="A framework for scientific/industrial CLIs and GUIs"
arch=('any')
url='http://taurus-scada.org/'
license=('LGPL3')
depends=(python-pyqt5 python-lxml python-click python-pint python-ply)
makedepends=(python-setuptools)
optdepends=('python-pytango: for integration with TANGO control system'
            'python-sardana: for integration with Sardana'
            'python-epics: for integration with EPICS control system'
            'python-taurus-pyqtgraph: for pyqtgraph based trends'
            'python-pymca5: for extra pymca5 widgets'
            'python-guiqwt: for extra guiqwt widgets'
            'spyder: for a qt based editor within taurus')
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a60f02adbe175c7405cd71e07a725786a6bfde02698655530b4e011206d4c40e')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
