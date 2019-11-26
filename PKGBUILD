# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=python-bme280-git
_pkgname=bme280
pkgver=eb28f73
pkgrel=2
pkgdesc="A Python library for accessing the BME280 combined humidity and pressure from Bosch via python-smbus using the I2C interface."
url="https://github.com/cmur2/python-bme280"
arch=("any")
license=("MIT")
depends=("python")
source=("${_pkgname}::git+https://github.com/cmur2/python-bme280.git")
sha512sums=("SKIP")
conflicts=("python-bme280")

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed -e 's|-|.|g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --skip-build -O1 --root="${pkgdir}"
}

# vim: ts=2 sw=2 et:
