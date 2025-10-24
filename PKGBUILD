# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-core
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.0.1
pkgrel=2
pkgdesc="Building applications with LLMs through composability"
arch=('any')
url='https://github.com/langchain-ai/langchain/tree/master/libs/core'
license=('MIT')
depends=(python-jsonpatch python-langsmith python-packaging python-pydantic python-pyyaml python-tenacity python-typing_extensions)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel' 'python-hatchling')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('ebe33155c940e1e32e90bedd896d56b26bb061505d3bb41a2cf8944f9361546a86f15c5b68e747aa3de199c4edf9ae11425161c10281c725dda00ddcb4ada817')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
