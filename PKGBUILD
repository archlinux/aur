pkgname=python-gradio-client
_module='gradio-client'
pkgver=0.6.0
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models'
arch=(any)
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('f7ac4a7bf19a2044f2c33fbce107f116b72befa218158f4d80cc06d11495ae9c568b7233c3882de5738bdd3024e8b6bd8309f785a8958943cf288def79a9b3fe')
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
