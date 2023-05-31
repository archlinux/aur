# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=taurus_pyqtgraph
pkgname=python-taurus-pyqtgraph
pkgver=0.6.1
pkgrel=1
pkgdesc="Taurus extension providing pyqtgraph-based widgets"
arch=('any')
url='http://taurus-scada.org/'
license=('LGPL3')
depends=(python-pyqtgraph python-taurus python-pyqt5-datavisualization)
optdepends=('python-pyhdbpp: Plotting data from the HDB++ archiver')
makedepends=(python-setuptools)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7e35065654d6e263d13a46269e5a45a7d44c08965fc7a542fadb4af83a8e1ae9')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
