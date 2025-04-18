# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-core
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.3.54
pkgrel=1
pkgdesc="Building applications with LLMs through composability"
arch=('any')
url='https://github.com/langchain-ai/langchain/tree/master/libs/core'
license=('MIT')
depends=(python-jsonpatch python-langsmith python-packaging python-pydantic python-pyyaml python-tenacity python-typing_extensions)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('c045721b711df9cc4c65f753f9c705fae90ccdd6bfb3d90465fc6e034d3f41d4fd1c1036b0aae2e54f69f53ce2920ee5127b4eb841e17b1ab26ca9d58e37ca12')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
