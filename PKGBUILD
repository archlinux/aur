pkgbase='python-langchain-core'
pkgname=('python-langchain-core')
_module='langchain-core'
_src_folder='langchain_core-0.0.12'
pkgver='0.0.12'
pkgrel=1
pkgdesc="Building applications with LLMs through composability"
url="https://github.com/langchain-ai/langchain"
depends=(python
python-anyio
python-jsonpatch
python-langsmith
python-packaging
python-pydantic
python-yaml
python-requests
python-tenacity
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('9c6cca4ed25a10950071be80dc62921b30caafae73ac1bd4b93d9f070967a7b2')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
