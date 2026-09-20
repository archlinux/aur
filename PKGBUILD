# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pysmartthings
pkgver=4.0.3
pkgrel=1
pkgdesc="A Python library for interacting with the SmartThings cloud API"
arch=(any)
url="https://github.com/pysmartthings/pysmartthings"
license=(Apache-2.0)
depends=(python python-aiohttp python-yarl python-mashumaro python-orjson)
makedepends=(python-build python-hatchling python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('be76fc5f000a758b6636d6c6b9a5ec59719e6174eb5685569486b2580e08e381')

build() {
    cd "pysmartthings-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "pysmartthings-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

