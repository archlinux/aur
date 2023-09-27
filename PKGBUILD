pkgname=python-gradio
_module='gradio'
pkgver=3.45.1
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('f9f4de10b62c8b2a17c11b846a0c0305da3cec187e67536ee4988c3f3344dda5bf5652a794afbf69fbca0fed6341e4d5f4b0fab1d7b0ba835d9e1e19d3d34ed0')
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
