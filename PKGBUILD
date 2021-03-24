# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-ssd1306
_pypi_pkgname=adafruit-circuitpython-ssd1306
pkgver=2.11.2
pkgrel=0
pkgdesc="CircuitPython library for SSD1306 OLED displays"
arch=('armv6h' 'armv7h')
url="https://github.com/adafruit/Adafruit_CircuitPython_ssd1306"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-adafruit-circuitpython-busdevice' 'python-adafruit-circuitpython-framebuf')
optdepends=('python-raspberry-gpio')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('76962cd92cea2ea912736957d998971413e8868656063a07c755ea1dd5dba3cb')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
