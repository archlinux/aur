# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=pymilvus
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=2.5.5
pkgrel=1
pkgdesc="Python Sdk for Milvus"
arch=('any')
url="https://github.com/milvus-io/${_pkgname}"
license=('Apache-2.0')
depends=(python-grpcio python-milvus-lite python-pandas python-protobuf python-dotenv python-setuptools python-ujson)
makedepends=('python-build' 'python-gitpython' 'python-installer' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('8985f018961853022e03639a9ff323d5c22d0b659e66e288f4d08de11789e1d4')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
