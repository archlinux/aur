# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-pureio
_pypi_pkgname=adafruit-pureio
pkgver=1.1.8
pkgrel=1
pkgdesc="Pure python (i.e. no native extensions) access to Linux IO including I2C and SPI. Drop in replacement for smbus and spidev modules"
arch=('any')
url="https://github.com/adafruit/Adafruit_Python_PureIO"
license=('MIT')
makedepends=('python-setuptools' 'python-pip')
depends=('python' 'python-raspberry-gpio')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/Adafruit_PureIO-${pkgver}.tar.gz")
sha256sums=('c6702589aa4bf6dc785e5f4e4ed7e68bef1d93d180633abe548fe3f39d36cad5')

build() {
    cd "${srcdir}/Adafruit_PureIO-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/Adafruit_PureIO-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
