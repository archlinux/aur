# Maintainer: Victor Lavaud <victor.lavaud@pm.me>
pkgname=python-aiozoneinfo
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="Tools to fetch zoneinfo with asyncio"
arch=('any')
url="https://github.com/bluetooth-devices/aiozoneinfo"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
source=("${_name}-${pkgver}.tar.gz::https://github.com/Bluetooth-Devices/${_name}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('457e2c665a2c7e093119efb87cc5e0da29e6f59aac504a544bec822c5be1cb6b')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
