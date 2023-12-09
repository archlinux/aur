pkgname=python-langchain
pkgver=0.0.348
pkgrel=1
pkgdesc='⚡ Building applications with LLMs through composability ⚡ '
arch=(x86_64)
url='https://github.com/langchain-ai/langchain'
license=('MIT')
source=("https://github.com/langchain-ai/langchain/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d2e7afef63f93e5721ee1301067da95df3a239dd50dda10c6af4893e3183a0f72a7ffdf5fe896a85a0dab4874a7069f868996ea24b4445f7f615ccffa3170ef6')
depends=(python
python-aiohttp
python-dataclasses-json
python-jsonpatch
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
