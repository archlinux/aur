# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=guiqwt
pkgname=python-$_name
pkgver=4.4.1
_pkgver=v$pkgver
pkgrel=2
pkgdesc="Efficient 2D plotting Python library based on PythonQwt "
arch=('x86_64')
url='https://github.com/PierreRaybaut/guiqwt'
license=('custom:CeCILL')
depends=(python-pyqt5 python-qtpy python-pythonqwt 'python-guidata>=3.0.1' python-numpy python-scipy python-pillow)
optdepends=(
  'python-pydicom: DICOM I/O support'
  'python-tifffile: for tiff file support'
)
makedepends=(python-setuptools python-sphinx cython)
source=("$_name-$pkgver.tar.gz::https://github.com/PierreRaybaut/$_name/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=('4427857b7aae80e3c157d4613158edc68b620428a066585adcdb5e0f05c5234f')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 Licence_CeCILL_V2-en.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
