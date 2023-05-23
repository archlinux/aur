pkgname=python-gradio-client
pkgver=0.2.5
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/a7/fc/98c3aecadd3b20de21ce1685059a79dab8c4b655ab7f7b742181fffd16df/gradio_client-0.2.5.tar.gz")
sha512sums=('70959dacf4ce5f13c798724c203732851e46c9d118adf648ece200ced55529a22362cba73e9cbf3ce43fa42ba9c22b058e3d62208fa5226cacc42f8bdda0a877')
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
