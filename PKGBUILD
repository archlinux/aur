pkgname=python-gradio
_module='gradio'
pkgver=4.8.0
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('9e300f6c265f99cd32aa764e79ef3b20fa8321e57afbdd239e63585b6a7d80dde7bb06be3f43bd1a478664aa87dc835a86a6b4f3a5763b780b62dbd304166b36')
depends=(python python-aiofiles python-altair python-fastapi python-ffmpy python-gradio-client python-httpx python-huggingface-hub python-importlib_resources python-jinja python-markupsafe python-matplotlib python-numpy python-orjson python-packaging python-pandas python-pillow python-pydantic python-pydub python-python-multipart python-yaml python-requests python-semantic-version python-tomlkit python-typer python-typing_extensions uvicorn)
depends+=(ipython nodejs python-transformers python-rich)
makedepends=(python-build python-installer python-wheel python-hatch-requirements-txt python-hatch-fancy-pypi-readme)

build() {
    cd gradio-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd gradio-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
