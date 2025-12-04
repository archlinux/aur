# Maintainer: Majorx234 <majorx234@gmail.com>

_pkgname=langchain-ollama
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.0.0
pkgrel=3
pkgdesc="This package contains the LangChain integration with Ollama"
arch=('any')
url="https://github.com/langchain-ai/langchain/tree/master/libs/partners/ollama"
license=('MIT')
depends=(python-langchain-core python-pytest python-pytest-asyncio python-pytest-socket python-syrupy python-ollama python-uuid-utils)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel' 'python-hatchling' 'ruff' 'mypy')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('b8e634592ee53140cb2cecf8b9c1cdbec02cc26f78793351f2e44a070190f1b38a1786131126c8229f0c6109ccdc59a5be98afdac0cd0cd584daeecb9b4c9906')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
