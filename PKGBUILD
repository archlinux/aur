# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=python-librespot
pkgver=0.0.8
pkgrel=1
pkgdesc="Open Source Spotify Client"
arch=("x86_64")
url="https://github.com/kokarare1212/librespot-python"
license=("Apache")
depends=(python python-defusedxml python-protobuf python-pycryptodomex python-pyogg python-requests python-websocket-client python-zeroconf)
makedepends=(python-build python-installer python-wheel)
source=("librespot-python-${pkgver}::https://github.com/kokarare1212/librespot-python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("0bb63f44ed84bcfb1e27f3e11d309b0cfeade6c5ab023ef7b50097237f4291f9")

build() {
  cd librespot-python-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd librespot-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
