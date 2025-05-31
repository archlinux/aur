# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

_name=opcua-asyncio
pkgname=python-opcua-asyncio
pkgver=1.1.6
pkgrel=1
pkgdesc='An OPC-UA client and server library for Python, also known as asyncua'
url=https://github.com/FreeOpcUa/opcua-asyncio
arch=(any)
license=(LGPL3)
depends=(python)
makedepends=(python-build python-installer python-wheel python-hatchling)

source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=(SKIP)

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
