# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-gpio
_pypi_pkgname=adafruit-gpio
pkgver=1.0.3
pkgrel=3
pkgdesc="Library to provide a cross-platform GPIO interface on the Raspberry Pi and Beaglebone Black using the RPi.GPIO and Adafruit_BBIO libraries."
arch=(any)
url="https://github.com/adafruit/Adafruit_Python_GPIO//"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-raspberry-gpio')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/Adafruit_GPIO-${pkgver}.tar.gz")
sha256sums=('d6465b92c866c51ca8f3bc1e8f2ec36f5ccdb46d0fd54101c1109756d4a2dcd0')

build() {
    cd "${srcdir}/Adafruit_GPIO-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/Adafruit_GPIO-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
