pkgname=python-gradio
_module='gradio'
pkgver=3.47.1
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('6e06feee89e5b55ca7ec39358d53006e34f25d0a7eed6fbb0c2ed75ddb01fe9a973f72dfe451eeb44e1bb6de782d42cc9e30124ba113d47456c8b448f02052c4')
depends=(
    'python-aiofiles'
    'python-aiohttp'
    'python-altair'
    'python-fastapi'
    'python-ffmpy'
    'python-gradio-client'
    'python-httpx'
    'python-huggingface-hub'
    'python-importlib_resources'
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
    ipython python-transformers python-scikit-image
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
