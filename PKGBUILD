# Maintainer: enihcam <enihcam@archlinux>
# Contributor: Zirui Guo <guozirui@hku.hk>
#
# NOTE: This package has unlisted PyPI-only runtime dependencies that pacman
# cannot satisfy. Install them with pip before use:
#   pip install --user nano-vectordb pipmaster pypinyin

pkgname=python-lightrag-hku
_pkgname=lightrag-hku
pkgver=1.5.4
pkgrel=1
pkgdesc='LightRAG: Simple and Fast Retrieval-Augmented Generation'
arch=('any')
url='https://github.com/HKUDS/LightRAG'
license=('MIT')
depends=(
    'python'
    'python-aiohttp'
    'python-configparser'
    'python-dotenv'
    'python-google-api-core'
    'python-google-genai'
    'python-json-repair'
    'python-networkx'
    'python-numpy'
    'python-packaging'
    'python-pandas'
    'python-pydantic'
    'python-yaml'
    'python-tenacity'
    'python-tiktoken'
    'python-xlsxwriter'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'python-aiofiles: Async file operations'
    'python-fastapi: API server support'
    'python-httpx: HTTP client'
    'python-openai: OpenAI provider'
    'python-pycryptodome: PDF encryption support'
    'python-pypdf: PDF processing'
    'python-docx: DOCX processing'
    'python-python-multipart: Form parsing'
    'python-pptx: PPTX processing'
    'python-pytz: Timezone support'
    'uvicorn: ASGI server'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/HKUDS/LightRAG/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('SKIP')

build() {
    cd "LightRAG-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "LightRAG-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
