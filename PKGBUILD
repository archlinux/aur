# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pysmartthings
pkgver=4.0.1
pkgrel=1
pkgdesc="A Python library for interacting with the SmartThings cloud API"
arch=(any)
url="https://github.com/pysmartthings/pysmartthings"
license=(Apache-2.0)
depends=(python-aiohttp python-yarl python-mashumaro python-orjson)
makedepends=(python-build python-hatchling python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5d2083db133d2bad7cb366dcfccbb3ee273b0b4b6524e9e9c13dd20b54fd63d0')

build() {
    cd "pysmartthings-$pkgver"
    python -m build --wheel --no-isolation
}

# check() {
#     cd "pysmartthings-$pkgver"
#     pytest -x
# }

package() {
    cd "pysmartthings-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

