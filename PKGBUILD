# Maintainer: Winux <winux@winux.it>

pkgname=python-gradio-client
_module='gradio-client'
pkgver=1.3.0
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models'
arch=(any)
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha512sums=('2d2b85cfa34b992dd919b333c3c5a0269a400e077634a67bfca93a3cf2fb93bb6abc9ffeef179309f6cfd2bac5153d91f399d92e89a5e9b306086477cbc273c2')
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
