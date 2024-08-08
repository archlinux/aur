# Maintainer: Winux <winux@winux.it>

pkgname=python-gradio
_module='gradio'
pkgver=4.41.0
pkgrel=1
pkgdesc='Build and share delightful machine learning apps, all in Python.'
arch=(any)
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('edeaf0856affba3fc8877f6d3af60986a33e83258ed1f1143a71a15d08d8000a1f586ae78aaf49530dce591176d22e8d9a5c0fab689d179e67d31052c32ac493')
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
