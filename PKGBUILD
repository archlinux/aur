# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-bme280
_pypi_pkgname=adafruit-circuitpython-bme280
pkgver=2.6.20
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
sha256sums=('6c3b6a71ecbe6556b3f0a84eebeb52b2178dc3844cd674d528fa50e00f7101a4')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
