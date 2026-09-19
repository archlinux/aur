# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=python-alpaca-py
_pkgname=alpaca-py
pkgver=0.44.0
pkgrel=1
pkgdesc="The Official Python SDK for Alpaca APIs"
url="https://github.com/alpacahq/alpaca-py"
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-poetry-dynamic-versioning' 'cython')
depends=('python-msgpack' 'python-pandas' 'python-pydantic' 'python-requests' 'python-websockets')
license=('Apache-2.0')
arch=('any')
source=("https://github.com/alpacahq/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d21976aed40087dd1b3d89416ea85c01776ee16168d930069e8e0b1be5c5e4a8')

build() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
