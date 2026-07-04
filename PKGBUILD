# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-llama-index-vector-stores-faiss
pkgver=0.6.0
pkgrel=1
pkgdesc="llama-index vector stores FAISS integration"
arch=('any')
url="https://github.com/run-llama/llama_index"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python-llama-index-core' 'faiss-cpu' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/llama-index-vector-stores-faiss/llama_index_vector_stores_faiss-0.6.0.tar.gz")
sha256sums=('00bfeb6cb7571e0e856566cb4f10c89b415b6108f151d9ad48ee9c31da563f5e')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
