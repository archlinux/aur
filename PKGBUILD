# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=compressed-rtf
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.0.7
pkgrel=1
pkgdesc="Compressed Rich Text Format (RTF) compression and decompression package"
arch=("any")
url="https://github.com/delimitry/${_pipname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('7c30859334839f3cdc7d10796af5b434bb326b9df7cb5a65e95a8eacb2951b0e')

build() {
    cd "${_pipname}-${pkgver}"
    rm pyproject.toml
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
