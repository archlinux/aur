# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=pymilvus
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=2.5.8
pkgrel=1
pkgdesc="Python Sdk for Milvus"
arch=('any')
url="https://github.com/milvus-io/${_pkgname}"
license=('Apache-2.0')
depends=(python-grpcio python-milvus-lite python-pandas python-protobuf python-dotenv python-setuptools python-ujson)
makedepends=('python-build' 'python-gitpython' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('fcdc54b0f00de277afe06beee4403ca29b281e350d80b460eba7f2628e8d611b8d7e461ec6979dc7c915db32327444e426f285b445b95639e1fd2563be4bbe83')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
