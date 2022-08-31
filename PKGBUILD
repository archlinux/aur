# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=python-librespot
pkgver=0.0.6
pkgrel=1
pkgdesc="Open Source Spotify Client"
arch=("x86_64")
url="https://github.com/kokarare1212/librespot-python"
license=("Apache")
depends=(python python-defusedxml python-protobuf python-pycryptodomex python-pyogg python-requests python-websocket-client python-zeroconf)
makedepends=(python-build python-installer python-wheel)
source=("librespot-python-${pkgver}::https://github.com/kokarare1212/librespot-python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("86295bf289241aca62e36f9d1ff03282f3da9a1191fa1848341ea9c171d39bf0")

build() {
  cd librespot-python-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd librespot-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
