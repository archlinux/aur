# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-llama-index
pkgver=0.14.23
pkgrel=1
pkgdesc="Interface between LLMs and external data sources"
arch=('any')
url="https://github.com/run-llama/llama_index"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python-llama-index-core' 'python-llama-index-embeddings-openai' 'python-llama-index-llms-openai' 'python-nltk' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/llama-index/llama_index-0.14.23.tar.gz")
sha256sums=('eac2049816a7410ff4568490cce4bdff99cda3ab99d59f52f6227dad22cda44b')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
