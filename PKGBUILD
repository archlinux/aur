##Email: pony at just-a-pony dot net
pkgname=esp-sdr-bridge
pkgver=0.1.0
pkgrel=1
pkgdesc="Real IQ from an ESP32-S3 running ESP-SDRover the plain USB cable"
arch=('x86_64')
url=https://github.com/z2labs/esp-sdr-bridge
license=('GPL3')
depends=(
    'python'
    'python-numpy'
    'python-pyserial'
)
makedepends=(
    "python-build"
    "python-installer"
    "python-wheel"
    "python-setuptools"
)
source=(
    "https://github.com/z2labs/esp-sdr-bridge/archive/refs/tags/v0.1.0.tar.gz"
)
sha256sums=('710b80c177d67c166ef14f2b110f79ab4549a0f7622d33020133ceb39f972ee4')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
