# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-pureio
_pypi_pkgname=adafruit-pureio
pkgver=1.1.10
pkgrel=0
pkgdesc="Pure python (i.e. no native extensions) access to Linux IO including I2C and SPI. Drop in replacement for smbus and spidev modules"
arch=('any')
url="https://github.com/adafruit/Adafruit_Python_PureIO"
license=('MIT')
makedepends=('python-setuptools' 'python-pip')
depends=('python')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/Adafruit_PureIO-${pkgver}.tar.gz")
sha256sums=('1206883753c0966309e6d02da970676e9bc7b503bb4a26f736e01739f56a64b9')

build() {
    cd "${srcdir}/Adafruit_PureIO-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/Adafruit_PureIO-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
