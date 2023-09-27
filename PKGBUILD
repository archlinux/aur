# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=PyMca5
pkgname=python-pymca5
pkgver=5.9.1
pkgrel=1
pkgdesc="Mapping and X-Ray Fluorescence Analysis"
arch=('x86_64')
url='http://pymca.sourceforge.net/'
license=('MIT')
depends=(python-numpy python-fisx python-h5py python-matplotlib python-scipy python-pyqt5 python-opengl python-qtconsole python-pyqt5-webengine)
makedepends=(python-setuptools python-numpy python-fisx cython)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a9c926ea8b7a7f8839cd48ee2ce70a62f556ac3b0d67b7601be3a5c2dbd099ab')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
