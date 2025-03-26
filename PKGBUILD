# Maintainer: Victor Lavaud <victor.lavaud@pm.me>
pkgname=python-aiozoneinfo
_name=${pkgname#python-}
pkgver=0.2.3
pkgrel=1
pkgdesc="Tools to fetch zoneinfo with asyncio"
arch=('any')
url="https://github.com/bluetooth-devices/aiozoneinfo"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
source=("${_name}-${pkgver}.tar.gz::https://github.com/Bluetooth-Devices/${_name}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('987ce2a7d5141f3f4c2e9d50606310d0bf60d688ad9f087aa7267433ba85fff3')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
