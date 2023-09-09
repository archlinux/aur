pkgname=python-gradio-client
pkgver=0.5.0
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/06/5d/f01e037e1e408c9df2ee3df7b1f14366a132c52182ff72d0321c049dd995/gradio_client-0.5.0.tar.gz")
sha512sums=('a70efabe195bb766b54eff85e62bea2721ad010dcf10a091b9fb24e8365b956eb359df336ec5883b9d3e35da08082919df1738a3c36ae2ec785ed77d3718b5c6')
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
