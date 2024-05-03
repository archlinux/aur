pkgname=python-gradio-client
_module='gradio-client'
pkgver=0.16.1
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models'
arch=(any)
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('03b6148079498299c2aecc2a7e15b4cf9ad533e3b23f8928215b34307ce81ee01b495868e1876f20c95cc11983ff0dd3d63bce7ac8b5461e576f74a508584388')
depends=(python python-fsspec python-httpx python-huggingface-hub python-packaging python-typing_extensions python-websockets)
makedepends=(python-build python-installer python-wheel python-hatch-requirements-txt python-hatch-fancy-pypi-readme)

build() {
    cd gradio_client-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd gradio_client-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
