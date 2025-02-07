# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-openvino-telemetry
pkgver=2025.0.0
pkgrel=1
_commit=efcbd7fe8401bc37ca693bb052d441a2bf049353
pkgdesc='Pythno library for sending statistics data from the OpenVINO toolkit components'
arch=('any')
url='https://github.com/openvinotoolkit/telemetry/'
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=('openvino-telemetry'::"git+https://github.com/openvinotoolkit/telemetry.git#commit=${_commit}?signed")
sha256sums=('6d1f91b0e037018ae20abad8c9272f5d612fd8ef781f8d2dd4ff925c056aae0a')
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194')

build() {
    cd openvino-telemetry
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" openvino-telemetry/dist/*.whl
}
