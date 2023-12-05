pkgbase='python-langchain-core'
pkgname=('python-langchain-core')
_module='langchain-core'
_src_folder='langchain_core-0.0.9'
pkgver='0.0.9'
pkgrel=1
pkgdesc="Building applications with LLMs through composability"
url="https://github.com/langchain-ai/langchain"
depends=(python python-jsonpatch python-langsmith python-pydantic python-tenacity)
depends+=(python-jinja python-transformers python-anyio)
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/14/d4/f561beb7cd6033f7aff26d109df4566568682824bd0c1ceff9bf2952e507/langchain_core-0.0.9.tar.gz")
sha256sums=('d3ba6e30ed57ba2a3cbe227daad81fc4edf29cd3d3e24b418782ba69b07cb07d')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
