pkgname=python-gradio
pkgver=3.32.0
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("$pkgname-$pkgver::https://github.com/gradio-app/gradio/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('0033ea0eed03009f16af4876f737dc3b24dc067c2ac12f4b177b3ad12684d7cdf9176acadcf8c2683dc82c4f28bc66713bceed959c5ca57e569ad6d9990ef017')
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
makedepends=(python-build python-installer python-wheel python-hatchling python-hatch-requirements-txt python-hatch-fancy-pypi-readme pnpm)

build() {
    cd gradio-$pkgver
    pnpm i --no-frozen-lockfile
    pnpm build
    python -m build --wheel --no-isolation
}

package() {
    cd gradio-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
