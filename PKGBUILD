# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-ssd1306
_pypi_pkgname=adafruit-circuitpython-ssd1306
pkgver=2.12.7
pkgrel=0
pkgdesc="CircuitPython library for SSD1306 OLED displays"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_CircuitPython_ssd1306"
license=('MIT')
makedepends=('python-setuptools' 'python-pip')
depends=('python' 'python-adafruit-circuitpython-typing' 'python-adafruit-circuitpython-busdevice' 'python-adafruit-circuitpython-framebuf')
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('b64445ec2317c8e05a3f4cfa5f3a72a7b8444c2cbfa6f6f0aca824c3d1534902')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
