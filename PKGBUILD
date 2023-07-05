# Maintainer: Lex Black <autumn-wind@web.de>

_module=ocrmypdf-papermerge
pkgname=python-${_module}
pkgver=0.4.6
pkgrel=1
pkgdesc="OCRmyPDF Papermerge plugin"
arch=(any)
url="https://github.com/papermerge/OCRmyPDF_papermerge"
license=(Apache)
depends=(ocrmypdf python-jinja python-lxml)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module//-/_}-$pkgver.tar.gz)
sha256sums=('373b7c23488d3b432f6fdb2ea40360f631f4e0290c128a296619f1d84174917b')

build() {
  cd "${_module//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
