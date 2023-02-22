# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=PythonQwt
pkgname=python-${_name,,}
pkgver=0.10.2
pkgrel=1
pkgdesc="Qt plotting widgets (pure Python reimplementation of Qwt C++ library)"
arch=('any')
url='https://github.com/PierreRaybaut/PythonQwt'
license=('custom')
depends=(python-pyqt5 qt5-svg 'python-qtpy' 'python-numpy')
makedepends=(python-setuptools)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a4913e781c8b06ddd56ed5cf6b99093b6b3285e0262bcc911bc4cb7c080d82f0')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
