# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=python-alpaca-py
_pkgname=alpaca_py
pkgver=0.42.0
pkgrel=1
_subfolder=2d/bf/3c2712ec8b9c4a36d5a7a2b58217512e4e26b3ffa02db554b33f9c9a5ba2
pkgdesc="The Official Python SDK for Alpaca APIs"
url="https://github.com/alpacahq/alpaca-py"
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-poetry-dynamic-versioning' 'cython')
depends=('python-msgpack' 'python-pandas' 'python-pydantic' 'python-requests' 'python-websockets')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/${_subfolder}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3ac4fd3439b8701d678db38bbc797b12bc003190996b19b0aa5f0d22aea65be7')

build() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
