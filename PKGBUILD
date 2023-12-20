pkgname=python-gradio
_module='gradio'
pkgver=4.11.0
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('29e5ef953263c5c5c7407709c4ded4b357ceb4eb807fa758444438918418db2008897eba2622f3951c01c5bb86c382839f3ce41350e4524951e6f4bda4a3c122')
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
