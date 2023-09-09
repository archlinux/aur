pkgname=python-gradio
pkgver=3.41.0
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("$pkgname-$pkgver::https://github.com/gradio-app/gradio/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('991e43562e5f44c4aeaf2f87cb4e676c6d65f0ea4732000a19a394e7e0eb6198f92adab207607e8e23f1a3b0a35f240014604bce013c3d57d3ade23097a537fb')
depends=(
    'python-aiofiles'
    'python-aiohttp'
    'python-altair'
    'python-fastapi'
    'python-ffmpy'
    'python-gradio-client'
    'python-httpx'
    'python-huggingface-hub'
    'python-jinja'
    'python-markdown-it-py'
    'python-pygments'
    'python-mdit_py_plugins'
    'python-typing_extensions'
    'python-markupsafe'
    'python-matplotlib'
    'python-numpy'
    'python-orjson'
    'python-pandas'
    'python-pillow'
    'python-pydantic'
    'python-python-multipart'
    'python-pydub'
    'python-yaml'
    'python-requests'
    'python-semantic-version'
    'python-typing_extensions'
    'uvicorn'
    'python-websockets'

    'python-linkify-it-py'
)
makedepends=(python-build python-installer python-wheel python-hatchling python-hatch-requirements-txt python-hatch-fancy-pypi-readme)

build() {
    cd gradio-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd gradio-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
