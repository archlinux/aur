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
sha256sums=('7d559ad48e925a9dec8cafdd08494165b0bc7bcbe5f3a2e4609aa354e0c59d91')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
