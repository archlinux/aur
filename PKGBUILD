# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=python-librespot
pkgver=0.0.9
pkgrel=1
pkgdesc="Open Source Spotify Client"
arch=("x86_64")
url="https://github.com/kokarare1212/librespot-python"
license=("Apache")
depends=(python python-defusedxml python-protobuf python-pycryptodomex python-pyogg python-requests python-websocket-client python-zeroconf)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("librespot-python-${pkgver}::https://github.com/kokarare1212/librespot-python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("9661ac975c2d83e0cd622b58aca2c6aba46e306cccf5315c8b4c3a2f684ed514")

build() {
  cd librespot-python-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd librespot-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
