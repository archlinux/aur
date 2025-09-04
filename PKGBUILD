# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-openvino-telemetry
pkgver=2025.2.0
pkgrel=1
_commit=f3e6d017529086711987004a6b320634b9bf5446
pkgdesc='Pythno library for sending statistics data from the OpenVINO toolkit components'
arch=('any')
url='https://github.com/openvinotoolkit/telemetry/'
license=('Apache-2.0')
depends=(
    'python')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
source=('openvino-telemetry'::"git+https://github.com/openvinotoolkit/telemetry.git#commit=${_commit}?signed")
sha256sums=('b5a885ca82f1f11f3e619ec3797622a551d997ba8c958b8a8c85dbd5423f79ad')
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194')

build() {
    cd openvino-telemetry
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" openvino-telemetry/dist/*.whl
}
