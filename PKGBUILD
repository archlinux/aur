# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-llama-index-retrievers-bm25
pkgver=0.7.1
pkgrel=1
pkgdesc="llama-index retrievers BM25 integration"
arch=('any')
url="https://github.com/run-llama/llama_index"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python-bm25s' 'python-llama-index-core' 'python-pystemmer' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/llama-index-retrievers-bm25/llama_index_retrievers_bm25-0.7.1.tar.gz")
sha256sums=('65bff95c5c1354854394209406d2d342ff5e62983ff2818fd2b85d5bed70bed0')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
