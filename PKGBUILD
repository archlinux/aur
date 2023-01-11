pkgname=python-gradio
pkgver=3.16.1b1
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("$pkgname-$pkgver::https://github.com/gradio-app/gradio/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('150a5a6ad5b35e70ad197f9e9948d85f6da4f6a7ababa291f61daf872ff4517af997f0925d4dbbce701682a892fa32b40f05b2e59c1b52ec03c5e17b11c067f4')
depends=(
    'python-aiohttp'
    'python-h11'
    'python-fastapi'
    'python-ffmpy'
    'python-markdown-it-py'
    'python-matplotlib'
    'python-numpy'
    'python-orjson'
    'python-pandas'
    'python-paramiko'
    'python-pillow'
    'python-pycryptodome'
    'python-python-multipart'
    'python-pydub'
    'python-yaml'
    'python-requests'
    'uvicorn'
    'python-jinja'
    'python-fsspec'
    'python-httpx'
    'python-pydantic'
    'python-websockets'
    'python-linkify-it-py'
    'python-mdit_py_plugins'
    'python-typing_extensions'
    'python-markupsafe'
    'python-altair'
)
makedepends=(python-build python-installer python-wheel python-hatchling python-hatch-requirements-txt python-hatch-fancy-pypi-readme pnpm)

build() {
    cd gradio-$pkgver
    sh ./scripts/build_frontend.sh
    python -m build --wheel --no-isolation
}

package() {
    cd gradio-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
