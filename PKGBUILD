# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

_name=opcua-asyncio
pkgname=python-opcua-asyncio
pkgver=1.0.4
pkgrel=1
pkgdesc='An OPC-UA client and server library for Python, also known as asyncua'
url=https://github.com/FreeOpcUa/opcua-asyncio
arch=(any)
license=(LGPL3)
depends=(python)
makedepends=(
    python-setuptools
    python-poetry
)
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=(SKIP)

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
