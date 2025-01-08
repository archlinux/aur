# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-openvino-telemetry
pkgver=2024.5.0
pkgrel=1
_commit=4a7e3b6672a488910e3910f045c7cd0da889b1c5
pkgdesc='Pythno library for sending statistics data from the OpenVINO toolkit components'
arch=('any')
url='https://github.com/openvinotoolkit/telemetry/'
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=('openvino-telemetry'::"git+https://github.com/openvinotoolkit/telemetry.git#commit=${_commit}")
sha256sums=('833786be6405f2eb38543024204bfbdef2bd4d5bebef8e7f61658e574d5ee602')

build() {
    cd openvino-telemetry
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" openvino-telemetry/dist/*.whl
}
