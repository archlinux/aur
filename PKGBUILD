# Maintainer: Winux <winux@winux.it>

pkgname=python-gradio
_module='gradio'
pkgver=5.1.0
pkgrel=1
pkgdesc='Build and share delightful machine learning apps, all in Python.'
arch=(any)
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('bfdcd1f49ca06112022e1c8801e6333993883e858a7da9b13d13d535ca17dd09f19e1652c61d341de1ea11c9f526b560832f4e014b4bc563d0a375607a400dac')
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
