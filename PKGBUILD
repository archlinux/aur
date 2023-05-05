pkgname=python-gradio-client
pkgver=0.1.4
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("https://files.pythonhosted.org/packages/74/f2/12a939404a7bc395acc3f31094522156437168ddcb594c2a02ff9eaec695/gradio_client-0.1.4.tar.gz")
sha512sums=('188b86bc3f60ab913b322d303949c12eac822781ca54b859e6a1c971b5a7edfd35290c7b6e4f29ff2e8b35c3beb25b9a84c4204ebf5ef29d3fa7a6edf04dc536')
depends=(
    python-requests
    python-websockets
    python-packaging
    python-fsspec
    python-huggingface-hub
    python-typing-extensions
    python-httpx
)
makedepends=(python-build python-installer python-wheel python-hatchling python-hatch-requirements-txt python-hatch-fancy-pypi-readme)

build() {
    cd gradio_client-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd gradio_client-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
