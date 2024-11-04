# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=pyxlsb
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.0.10
pkgrel=1
pkgdesc="Excel 2007-2010 Binary Workbook (xlsb) parser"
arch=('any')
url="https://github.com/willtrnr/${_pkgname}"
license=('LGPL-3.0-or-later')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('8062d1ea8626d3f1980e8b1cfe91a4483747449242ecb61013bc2df85435f685')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
