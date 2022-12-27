# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=dicttoxml
pkgname=python-${_base}
pkgdesc="Converts a Python dictionary or other native data type into a valid XML string"
pkgver=1.7.16
pkgrel=1
arch=(any)
url="https://github.com/quandyfactory/${_base}"
license=(GPL)
depends=(python)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('ac9d5b0f8acd0a18f918309cacba131843feebd6ad7c94935062d6e1ed7b529c5b91d6a9b65787647f73616e974d0599e8515bb07d69b036483d3a733e4dec6a')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENCE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
