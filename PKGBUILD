pkgname=python-gradio-client
_module='gradio-client'
pkgver=0.7.3
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models'
arch=(any)
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('a2f73fff6012db39ff8b5d7918ee85182edae535386ea1744e1d55139dad91daa70adb02649958bc2709647572c85063b4cb9df1452ccc8de14fac51211c8458')
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
