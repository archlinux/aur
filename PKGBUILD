# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=camelot
pkgname=python-camelot
pkgver=0.11.0
pkgrel=1
pkgdesc='A Python library to extract tabular data from PDFs'
arch=('any')
url='https://github.com/camelot-dev/camelot'
license=('MIT')
depends=(
  ghostscript
  python-chardet
  python-click
  python-ghostscript
  python-matplotlib
  python-numpy
  python-opencv
  python-openpyxl
  python-pandas
  python-pdfminer
  python-pdftopng
  python-pypdf
  python-tabulate
  tk
)
makedepends=(
  python-setuptools
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/camelot-dev/camelot/archive/v${pkgver}.tar.gz")
sha512sums=('5b34a915979a9b5661a5254e6d0be2198d35530b9bc012b880391f27c0b443e5a9ab68723c2583f66873ffb6ff36a78ac953dedb394d08f08765c72aa95c7054')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
