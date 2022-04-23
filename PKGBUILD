# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=python-librespot
pkgver=0.0.1
pkgrel=1
pkgdesc="Open Source Spotify Client"
arch=("x86_64")
url="https://github.com/kokarare1212/librespot-python"
license=("Apache")
depends=(python python-defusedxml python-protobuf python-pycryptodomex python-pyogg python-requests python-websocket-client python-zeroconf)
makedepends=(python-build python-installer python-wheel)
source=("librespot-python-${pkgver}::https://github.com/kokarare1212/librespot-python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("f135e43eb1813694ec8d72e69c15dad7bac7b2c81624c054bc64b1b04e4c7354")

build() {
  cd librespot-python-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd librespot-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
