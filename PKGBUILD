# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=dicttoxml
pkgname=python-${_base}
pkgdesc="Converts a Python dictionary or other native data type into a valid XML string"
pkgver=1.7.15
pkgrel=1
arch=(any)
url="https://github.com/quandyfactory/${_base}"
license=(GPL)
depends=(python)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('0c9ca5381563a145888fd7a2525a1bac6c59453b123194956e354237f9da78668590d10cc87a21e50f1020e8d1bc2dac018be264fb441652b1f74abefc38890c')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENCE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
