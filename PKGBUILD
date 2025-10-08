# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=python-alpaca-py
_pkgname=alpaca-py
pkgver=0.42.2
pkgrel=1
pkgdesc="The Official Python SDK for Alpaca APIs"
url="https://github.com/alpacahq/alpaca-py"
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-poetry-dynamic-versioning' 'cython')
depends=('python-msgpack' 'python-pandas' 'python-pydantic' 'python-requests' 'python-websockets')
license=('Apache-2.0')
arch=('any')
source=("https://codeload.github.com/alpacahq/${_pkgname}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('f8e622167370dbfc4ba54f6631097851538a44ee4877c66d6a14f6665cfb67ef')

build() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
