# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-litellm
pkgver=1.91.1
pkgrel=1
pkgdesc="Call all LLM APIs using the OpenAI format"
arch=('any')
url="https://github.com/BerriAI/litellm"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build' )
depends=('python-aiohttp' 'python-click' 'python-httpx' 'python-jinja' 'python-jsonschema' 'python-openai' 'python-pydantic' 'python-dotenv' 'python-tiktoken' 'python-tokenizers' 'python-importlib-metadata' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/litellm/litellm-1.91.1.tar.gz")
sha256sums=('49a24593df7e37262c52243a8e07572d451d37c100aa1b1f347d80d501d2e386')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
