# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=guiqwt
pkgname="python-${_name}"
pkgver=4.4.5
pkgrel=1
pkgdesc="Efficient 2D plotting Python library based on PythonQwt"
arch=('x86_64')
url="https://github.com/PlotPyStack/${_name}"
license=('custom:CeCILL')
depends=(python-pyqt5 python-qtpy python-pythonqwt 'python-guidata>=3.0.1' python-numpy python-scipy python-pillow python-importlib-metadata)
optdepends=(
  'python-pydicom: DICOM I/O support'
  'python-tifffile: for tiff file support'
)
makedepends=(python-setuptools python-sphinx cython)
source=("$_name-$pkgver.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('128c115e0f1ced462a321675a3a3ae79cb57f83154a967f96e4227057cce5f6b')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 Licence_CeCILL_V2-en.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
