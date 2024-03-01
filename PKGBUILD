pkgname=python-gradio-client
_module='gradio-client'
pkgver=0.10.1
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models'
arch=(any)
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('02845a60daaa1b31c898428e075114113a841b7f33da2e6de1a2850164bd8e00446823094ce01cd680a7c2f77d7dfcd6829a25122231e53e03ee544dcb81788f')
depends=(python python-fsspec python-httpx python-huggingface-hub python-packaging python-typing_extensions python-websockets)
makedepends=(python-build python-installer python-wheel)

build() {
    cd gradio_client-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd gradio_client-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
