# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=PyMca5
pkgname=python-pymca5
pkgver=5.9.0
pkgrel=1
pkgdesc="Mapping and X-Ray Fluorescence Analysis"
arch=('x86_64')
url='http://pymca.sourceforge.net/'
license=('MIT')
depends=(python-numpy python-fisx python-h5py python-matplotlib python-scipy python-pyqt5 python-opengl python-qtconsole python-pyqt5-webengine)
makedepends=(python-setuptools python-numpy python-fisx cython)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dc6977b43e1bf3e436d797be3cce3e78112cec8d81f3185efe52962b00bfd079')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
