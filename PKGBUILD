# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-core
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.3.33
pkgrel=1
pkgdesc="Building applications with LLMs through composability"
arch=('any')
url='https://github.com/langchain-ai/langchain/tree/master/libs/core'
license=('MIT')
depends=(python-jsonpatch python-langsmith python-packaging python-pydantic python-pyyaml python-tenacity python-typing_extensions)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('b5dd93a4e7f8198d2fc6048723b0bfecf7aaf128b0d268cbac19c34c1579b953')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
