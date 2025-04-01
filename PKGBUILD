# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-openvino-telemetry
pkgver=2025.1.0
pkgrel=1
_commit=1fa43eee43d3372be09da32dab8040d819587297
pkgdesc='Pythno library for sending statistics data from the OpenVINO toolkit components'
arch=('any')
url='https://github.com/openvinotoolkit/telemetry/'
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=('openvino-telemetry'::"git+https://github.com/openvinotoolkit/telemetry.git#commit=${_commit}?signed")
sha256sums=('0ef8d7499b6e1a909378e0772f7cf0e1d738fd2a05fa9af5ca29177adbdc0008')
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194')

build() {
    cd openvino-telemetry
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" openvino-telemetry/dist/*.whl
}
