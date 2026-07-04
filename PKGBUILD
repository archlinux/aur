# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-llama-index-embeddings-openai
pkgver=0.6.0
pkgrel=1
pkgdesc="llama-index embeddings OpenAI integration"
arch=('any')
url="https://github.com/run-llama/llama_index"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python-openai' 'python-llama-index-core' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/llama-index-embeddings-openai/llama_index_embeddings_openai-0.6.0.tar.gz")
sha256sums=('eb3e6606be81cb89125073e23c97c0a6119dabb4827adbd14697c2029ad73f29')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
