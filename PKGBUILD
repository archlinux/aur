# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-llama-index-llms-openai
pkgver=0.7.9
pkgrel=1
pkgdesc="llama-index LLMs OpenAI integration"
arch=('any')
url="https://github.com/run-llama/llama_index"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python-openai' 'python-llama-index-core' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/llama-index-llms-openai/llama_index_llms_openai-0.7.9.tar.gz")
sha256sums=('f54a24b717134c86e724007057a06a84394f019d1f01e918b624894e208a86df')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
