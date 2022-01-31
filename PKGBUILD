# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=python-bme280
_pkgname=bme280
pkgver=0.2.4
pkgrel=3
pkgdesc="Interfacing a Bosch BME280 digital sensor module in Python using i2c on the Raspberry Pi"
url="https://github.com/rm-hull/bme280"
arch=("any")
license=("MIT")
depends=("python" "i2c-tools" "python-pytz")
makedepends=('python-setuptools')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/rm-hull/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('51cd7e0812ba7d07506811bd3e436487d187833fc4c9ae83b7e7b03943a49ef39eb3109957d9ee4368eb98a185d6f4888e476d4237be291cb61b5620bb11b9bb')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
