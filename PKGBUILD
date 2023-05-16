# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-ssd1306
_pypi_pkgname=adafruit-ssd1306
pkgver=1.6.2
pkgrel=4
pkgdesc="Python library to use SSD1306-based 128x64 or 128x32 pixel OLED displays with a Raspberry Pi or Beaglebone Black"
arch=(any)
url="https://github.com/adafruit/Adafruit_Python_SSD1306/"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-adafruit-gpio' 'python-adafruit-pureio')
optdepends=('python-pillow')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/Adafruit_SSD1306-${pkgver}.tar.gz")
sha256sums=('4768518204037db82eb6b90838938f8519ecd29fe3d6cc3efa0d1100ed527727')

build() {
    cd "${srcdir}/Adafruit_SSD1306-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/Adafruit_SSD1306-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
