# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Malte Jürgens <maltejur@dismail.de>

pkgname=python-librespot
pkgver=0.0.10
pkgrel=1
pkgdesc="Open Source Spotify Client"
arch=(any)
url="https://github.com/kokarare1212/librespot-python"
license=(Apache-2.0)
depends=(python python-defusedxml python-protobuf python-pycryptodomex python-pyogg python-requests python-websocket-client python-zeroconf)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('781f9d4d9b01e27d59a0794061a6f82cb34f0ec14b1225a8010b471ebdc9709f')

build() {
    cd "librespot-python-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "librespot-python-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
