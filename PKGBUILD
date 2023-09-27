pkgname=python-gradio-client
_module='gradio-client'
pkgver=0.5.2
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models'
arch=(any)
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('33046ae42513e3453b4edd0d7d2cb818e31ee677e6cb60853394de40f1b142250bb13563d30baf251bac944444b03044bad4f85e664e849dbc893e809634eb90')
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
