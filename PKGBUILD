# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=python-alpaca-py
_pkgname=alpaca_py
pkgver=0.35.0
pkgrel=1
_subfolder=1b/d1/c75ea45936dc1418b8f7d55612fcb647f69bfa44e14912a9819ef407e155
pkgdesc="The Official Python SDK for Alpaca APIs"
url="https://github.com/alpacahq/alpaca-py"
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-poetry-dynamic-versioning' 'cython')
depends=('python-msgpack' 'python-pandas' 'python-pydantic' 'python-requests' 'python-websockets')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/${_subfolder}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ab7f440da7b293ed6305d5100b38767b0d068bbb85473d286cdc2ddde22a295f')

build() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
