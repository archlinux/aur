# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=guiqwt
pkgname=python-$_name
pkgver=4.4.3
pkgrel=1
pkgdesc="Efficient 2D plotting Python library based on PythonQwt"
arch=('x86_64')
url="https://github.com/PlotPyStack/${_name}"
license=('custom:CeCILL')
depends=(python-pyqt5 python-qtpy python-pythonqwt 'python-guidata>=3.0.1' python-numpy python-scipy python-pillow)
optdepends=(
  'python-pydicom: DICOM I/O support'
  'python-tifffile: for tiff file support'
)
makedepends=(python-setuptools python-sphinx cython)
source=("$_name-$pkgver.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ac9423a24e2b07be531067a7fa8543470bdc9a1d6bd2446467db29e5b505b78d')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 Licence_CeCILL_V2-en.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
