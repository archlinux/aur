pkgname=python-gradio
_module='gradio'
pkgver=4.19.2
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('00216e86c0fe1b6fc638caaba69c53910689a255bd91b8bc3c020a52d081077d26def7897d3228f0419469672d3061e58db4eb2b67cc7b71ad38fc90d675d1ac')
depends=(python python-aiofiles python-altair python-fastapi python-ffmpy python-gradio-client python-httpx python-huggingface-hub python-importlib_resources python-jinja python-markupsafe python-matplotlib python-numpy python-orjson python-packaging python-pandas python-pillow python-pydantic python-pydub python-python-multipart python-yaml python-semantic-version python-tomlkit python-typer python-typing_extensions uvicorn)
makedepends=(python-build python-installer python-wheel python-hatch-requirements-txt python-hatch-fancy-pypi-readme)

build() {
    cd gradio-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd gradio-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
