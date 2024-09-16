# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-bme280
_pypi_pkgname=adafruit-circuitpython-bme280
pkgver=2.6.25
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
sha256sums=('1cb991d117dc2e922f4f619ff6af43d6a93a6e2cfbeb4ed31fb95f70782d87a1')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
