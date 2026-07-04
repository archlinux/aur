# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-litellm
pkgver=1.86.2
pkgrel=1
pkgdesc="Call all LLM APIs using the OpenAI format"
arch=('any')
url="https://github.com/BerriAI/litellm"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build' )
depends=('python-aiohttp' 'python-click' 'python-httpx' 'python-jinja' 'python-jsonschema' 'python-openai' 'python-pydantic' 'python-python-dotenv' 'python-tiktoken' 'python-tokenizers' 'python-importlib-metadata' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/litellm/litellm-1.86.2.tar.gz")
sha256sums=('7d559ad48b97d796ff325af88fd7eebbdc66e58773fb5312130ab1cac968f8f3')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
