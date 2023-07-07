_pkgname=Adafruit_nRF52_nrfutil
pkgname=python-adafruit-nrfutil
pkgver=0.5.3.post17
pkgrel=2
pkgdesc="Python 3 version of Nordic Semiconductor nrfutil utility and Python library (modified by Adafruit)"
arch=('any')
url='https://github.com/adafruit/Adafruit_nRF52_nrfutil'
license=('BSD')
depends=(python python-behave python-click python-ecdsa python-pyserial)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/adafruit/Adafruit_nRF52_nrfutil/archive/$pkgver.tar.gz")
sha256sums=('ce985099b797a8739dc59eb573c9c2d29d74af8a2126bdc3f166fd6844b5d701')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}