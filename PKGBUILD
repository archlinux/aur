# Maintainer: Winux <winux@winux.it>

pkgname=python-gradio
_module='gradio'
pkgver=4.42.0
pkgrel=1
pkgdesc='Build and share delightful machine learning apps, all in Python.'
arch=(any)
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('ec245d46bf80a160df0ae5977a176602559c51a4f24c5a001142f1466d891423b96cd1014b76c978b6f9a61740a0e88ab455aaa822a27986d6d88a3ce07f83b2')
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
