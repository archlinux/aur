# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=python-luma-oled
pkgver=3.13.0
pkgrel=1
pkgdesc="OLED display support for SSD1306, SSD1309, SSD1322, SSD1325, SSD1327, SSD1331, SSD1351, SH1106, SH1107 or WS0010 using I2C/SPI/Parallel"
arch=('any')
url='https://github.com/rm-hull/luma.oled'
license=('MIT')
makedepends=(python-setuptools)
depends=(python-luma-core)
source=("$pkgname-$pkgver.tar.gz::https://github.com/rm-hull/luma.oled/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c711b8390bfdf03a37cc7e3184f66fb7064d656e0b0c379bc4b520b092c90f27')

build() {
  cd "luma.oled-$pkgver"
  python setup.py build
}

package() {
  cd "luma.oled-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
  install -D -m644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
