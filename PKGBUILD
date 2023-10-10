# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=PythonQwt
pkgname=python-${_name,,}
pkgver=0.10.5
pkgrel=1
pkgdesc="Qt plotting widgets (pure Python reimplementation of Qwt C++ library)"
arch=('any')
url="https://github.com/PlotPyStack/${_name}"
license=('custom')
depends=(python-pyqt5 qt5-svg 'python-qtpy' 'python-numpy')
makedepends=(python-setuptools)
source=("$_name-$pkgver.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fbfa9c2ccb5a1dbb6c76750478717342151480a70e0fb73feff86b701c118658')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
