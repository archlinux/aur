pkgbase='python-langchain-community'
pkgname=('python-langchain-community')
_module='langchain-community'
_src_folder='langchain_community-0.0.1'
pkgver='0.0.1'
pkgrel=1
pkgdesc="Community contributed LangChain integrations."
url="https://github.com/langchain-ai/langchain"
depends=('python'
python-aiohttp
python-dataclasses-json
python-langchain-core
python-langsmith
python-numpy
python-yaml
python-requests
python-sqlalchemy
python-tenacity
)
makedepends=('python-build' 'python-installer' 'python-wheel' python-poetry)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/ec/6c/92c7d665220de314851f59b6ce0080ca1731298455233682a293a8306609/langchain_community-0.0.1.tar.gz")
sha256sums=('271a959cb3a0efc3e9afb62799588ff6cd774fa333c6d514a9be1d5809fb112b')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
