# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-core
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.2.0
pkgrel=1
pkgdesc="Building applications with LLMs through composability"
arch=('any')
url='https://github.com/langchain-ai/langchain/tree/master/libs/core'
license=('MIT')
depends=(python-jsonpatch python-langsmith python-packaging python-pydantic python-pyyaml python-tenacity python-typing_extensions)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel' 'python-hatchling')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('f481e392a48edfe9818a7816c33105530ad229829c2bffdfa0c9f6d79e926f6d6eda58c4f80284af634308161abe328497bff5a58fa5e2a6b39562374678f6a2')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
