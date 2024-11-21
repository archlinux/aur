# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=bluetooth-data-tools
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.20.0
pkgrel=1
pkgdesc="Tools for converting bluetooth data and packets"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/bdraco/bluetooth-data-tools"
license=("Apache-2.0")
depends=(python-cryptography)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('1c11aca1a25e045e0baf1f88ebb0de53d2844e357d6017dc6c143c20e20b3436')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
