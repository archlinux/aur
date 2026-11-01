# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pysmartthings
pkgver=4.1.0
pkgrel=1
pkgdesc="A Python library for interacting with the SmartThings cloud API"
arch=(any)
url="https://github.com/pysmartthings/pysmartthings"
license=(Apache-2.0)
depends=(python python-aiohttp python-yarl python-mashumaro python-orjson)
makedepends=(python-build python-hatchling python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9c1964e47b08286ae27064fe0930c2c30bcf31bec5bca3daae7188b53a51f43a')

build() {
    cd "pysmartthings-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "pysmartthings-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

