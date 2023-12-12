pkgname=python-langchain
pkgver=0.0.349
pkgrel=1
pkgdesc='⚡ Building applications with LLMs through composability ⚡ '
arch=(x86_64)
url='https://github.com/langchain-ai/langchain'
license=('MIT')
source=("https://github.com/langchain-ai/langchain/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('461b2f890c20e077238059aced38636fe669f05b849846ac268d2fadf1f55f553a357d05dac3b8d8d2934ceb7aa24dac7f802b293ce4ef02b058436a9a78bf59')
depends=(python
python-aiohttp
python-dataclasses-json
python-jsonpatch
python-langchain-community
python-langchain-core
python-langsmith
python-numpy
python-pydantic
python-yaml
python-requests
python-sqlalchemy
python-tenacity
)
makedepends=('python-build' 'python-installer' 'python-wheel')

build() {
    cd langchain-$pkgver/libs/langchain
    python -m build --wheel --no-isolation
}

package() {
    cd langchain-$pkgver/libs/langchain
    python -m installer --destdir="$pkgdir" dist/*.whl
}
