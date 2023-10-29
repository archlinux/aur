# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-bme280
_pypi_pkgname=adafruit-circuitpython-bme280
pkgver=2.6.23
pkgrel=0
pkgdesc="CircuitPython library for the Bosch BME280 temperature/humidity/pressure sensor"
arch=('any')
url="https://github.com/adafruit/Adafruit_CircuitPython_BME280"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=(
'python'
'python-adafruit-circuitpython-busdevice'
)
optdepends=('python-rpi-gpio')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('eb9f74c2bf12c600df6766e3f544ac645a63e699e702ca84ed6b42d53ce5d67f')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
