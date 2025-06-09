# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

_name=opcua-asyncio
pkgname=python-opcua-asyncio
pkgver=1.1.6
pkgrel=2
pkgdesc='An OPC-UA client and server library for Python, also known as asyncua'
url=https://github.com/FreeOpcUa/opcua-asyncio
arch=(any)
license=(LGPL-3.0-only)
depends=(
    python
    python-aiofiles
    python-aiosqlite
    python-cryptography
    python-dateutil
    python-importlib-metadata
    python-pyopenssl
    python-pytz
    python-sortedcontainers
    python-typing_extensions
)
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
