# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-litellm
pkgver=1.91.0
pkgrel=1
pkgdesc="Call all LLM APIs using the OpenAI format"
arch=('any')
url="https://github.com/BerriAI/litellm"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build' )
depends=('python-aiohttp' 'python-click' 'python-httpx' 'python-jinja' 'python-jsonschema' 'python-openai' 'python-pydantic' 'python-dotenv' 'python-tiktoken' 'python-tokenizers' 'python-importlib-metadata' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/litellm/litellm-1.91.0.tar.gz")
sha256sums=('4fd469fe7356ba8fcc86f4efdf332e3426b760962ab12331fdaf1a01aeec065f')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
