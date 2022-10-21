pkgname=python-gradio
pkgver=3.6.0b1
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("$pkgname-$pkgver::https://github.com/gradio-app/gradio/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8fdb638155c36d3081d979c61c769bfa53ea372cfe73f275b89e38e135d2375837c068ae4d25bb36393dfc3878d28f59fd001fd74d994947e9b97cdf30275a37')
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
