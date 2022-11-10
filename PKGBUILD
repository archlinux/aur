# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=python-librespot
pkgver=0.0.7
pkgrel=1
pkgdesc="Open Source Spotify Client"
arch=("x86_64")
url="https://github.com/kokarare1212/librespot-python"
license=("Apache")
depends=(python python-defusedxml python-protobuf python-pycryptodomex python-pyogg python-requests python-websocket-client python-zeroconf)
makedepends=(python-build python-installer python-wheel)
source=("librespot-python-${pkgver}::https://github.com/kokarare1212/librespot-python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("440d04e81d57b50b4c48e62a834a6c438f5d9566509b6f6969878417ad4072dc")

build() {
  cd librespot-python-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd librespot-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
