pkgname=python-gradio
pkgver=3.20.0
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("$pkgname-$pkgver::https://github.com/gradio-app/gradio/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4606ae0a541139d2191dd57f27111a142eafa5a5810beecb1ecf65cacbff24d681ad91e7121189af65bde13150129c71842bd949ea606f019bc17dfbfa686a97')
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
