pkgname=python-gradio
pkgver=3.28.1
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("$pkgname-$pkgver::https://github.com/gradio-app/gradio/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ca265f7f3d83a742edc9a2728435fcfc382d54a1507a6c9ecdec30833db74c7fe44097df8aa703c7045ad1057f60dcd451ff2674d7bcf43e8c9772bd47c526c6')
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
