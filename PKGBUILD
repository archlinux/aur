pkgname=python-gradio-client
_module='gradio-client'
pkgver=0.7.1
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models'
arch=(any)
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('d6c9ff4dd06dcdab93135b07c47f0b3ccd69b1668b0f84a2d638b9e236210e685d163883a2e03f1a7afc4230abb2d28a3c5ac3ba77a8f00aa507099534dfb6ff')
depends=(python python-fsspec python-httpx python-huggingface-hub python-packaging python-requests python-typing_extensions python-websockets)
depends+=(python-gradio python-typer)
makedepends=(python-build python-installer python-wheel)

build() {
    cd gradio_client-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd gradio_client-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
