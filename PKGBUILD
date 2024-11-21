# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=voluptuous-openapi
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.0.5
pkgrel=1
pkgdesc="Convert voluptuous schemas to OpenAPI Schema object"
arch=('any')
url="https://github.com/home-assistant-libs/voluptuous-openapi"
license=("Apache-2.0")
depends=("python-voluptuous")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('1619cd298da0024fa01338ac5a9ce3b3b7059205ce3c69230c24803b11308fb0')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
