# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=guiqwt
pkgname=python-$_name
pkgver=4.3.3
pkgrel=1
pkgdesc="Efficient 2D plotting Python library based on PythonQwt "
arch=('x86_64')
url='https://github.com/PierreRaybaut/guiqwt'
license=('custom:CeCILL')
depends=(python-pyqt5 python-qtpy python-pythonqwt python-guidata python-numpy python-scipy python-pillow)
optdepends=(
  'python-pydicom: DICOM I/O support'
  'python-tifffile: for tiff file support'
)
makedepends=(python-setuptools python-sphinx cython)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('28f1d2a73ef53a684501f6c7067a57354ff46582bc4f34f7abee46c38630dc4a')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 Licence_CeCILL_V2-en.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
