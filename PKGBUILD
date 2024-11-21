# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=aiohttp-fast-zlib
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.2.0
pkgrel=1
pkgdesc="Use the fastest installed zlib compatible library with aiohttp"
arch=('any')
url="https://github.com/bdraco/aiohttp-fast-zlib"
license=("Apache-2.0")
depends=(python-aiohttp)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
optdepends=(python-isal python-zlib-ng)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('e2e6c27a7ffc825cdd50d6f80e302ebbc025b43c876c00f01dc2ae759905dce8')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
