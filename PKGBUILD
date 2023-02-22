# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=taurus_pyqtgraph
pkgname=python-taurus-pyqtgraph
pkgver=0.6.0
pkgrel=1
pkgdesc="Taurus extension providing pyqtgraph-based widgets"
arch=('any')
url='http://taurus-scada.org/'
license=('LGPL3')
depends=(python-pyqtgraph python-taurus python-pyqt5-datavisualization)
optdepends=('python-pyhdbpp: Plotting data from the HDB++ archiver')
makedepends=(python-setuptools)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ce2251f0f80e1cc6b72b2fdd4fa9c8edf06761709d03f656e9f97651208e057f')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
