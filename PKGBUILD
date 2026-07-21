# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Kevin Puertas <kevinpr@jkanetwork.com>

pkgname=python-dnsrecon
pkgver=1.6.3
pkgrel=1
pkgdesc='A DNS Enumeration and Scanning tool in Python'
arch=(any)
url="https://github.com/darkoperator/dnsrecon"
license=(GPL-2.0-or-later)
depends=(
    python
    python-dnspython
    python-fastapi
    python-httpx
    python-loguru
    python-netaddr
    python-slowapi
    python-stamina
    python-ujson
    uvicorn)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7f7e230bb3fae959ff37ac19d1c1deea25089ac6a1bbbbf3b4e26e78ed96bd7a')

build() {
    cd "dnsrecon-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "dnsrecon-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
