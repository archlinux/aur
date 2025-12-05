# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=pymilvus
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=2.6.5
pkgrel=1
pkgdesc="Python Sdk for Milvus"
arch=('any')
url="https://github.com/milvus-io/${_pkgname}"
license=('Apache-2.0')
depends=(python-grpcio python-milvus-lite python-pandas python-protobuf python-dotenv python-setuptools python-ujson)
makedepends=('python-build' 'python-gitpython' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('7bdf8575d1e553a66ea9b8f146a58760f389e047a1daaafe5a9534d58594ad491562c8e604c5b86bd395a2f91d019eddf190b2b4069012bb0531002cfd1a4e58')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
