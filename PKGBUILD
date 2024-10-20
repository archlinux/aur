# Maintainer: Winux <winux@winux.it>

pkgname=python-gradio-client
_module='gradio-client'
pkgver=1.4.0
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models'
arch=(any)
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('431a15926d8920e6c44f16e13300ef6a700933bd8653cd8b9bc8572de2840bb97e02dcd6008c4eeb11de8f0b92940369c56a5ba16339e05160759472812ac9c7')
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
