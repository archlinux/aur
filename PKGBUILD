# Maintainer: Dmitriy Geels <dmitriy dot geels at gmail dot com>
# Contributor: enihcam <enihcam@archlinux.us>

pkgname=python-llama-index-embeddings-openai
pkgver=0.7.0
pkgrel=1
pkgdesc="llama-index embeddings OpenAI integration"
arch=('any')
url="https://github.com/run-llama/llama_index"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python>=3.10' 'python-openai>=1.1.0' 'python-llama-index-core>=0.13.0' 'python-llama-index-core<0.15')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/llama-index-embeddings-openai/llama_index_embeddings_openai-$pkgver.tar.gz")
sha256sums=('5842ef9503501a713363ea8b28462f4ee4f5e778a5c852399f771ff417906507')

build() {
    cd "$srcdir/llama_index_embeddings_openai-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/llama_index_embeddings_openai-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
