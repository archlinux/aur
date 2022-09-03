# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-st7735
_pypi_pkgname=adafruit-circuitpython-st7735
pkgver=1.2.7
pkgrel=0
pkgdesc="CircuitPython library for SSD1306 OLED displays"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_CircuitPython_ssd1306"
license=('MIT')
makedepends=('python-setuptools' 'python-pip')
depends=('python' 'python-adafruit-blinka-displayio')
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('0b5ec99a56dc626d4491a32d03d832890d66bb46453eb84e5b4a273d4f357075')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
