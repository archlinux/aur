# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=dicttoxml
pkgname=python-${_base}
pkgdesc="Converts a Python dictionary or other native data type into a valid XML string"
pkgver=1.7.4
pkgrel=2
arch=(any)
url="https://github.com/quandyfactory/${_base}"
license=(GPL)
depends=(python)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('91abcf2b9b248717618e9fc1c8694e881b9deaa16438dd4674f94a22b4aabfdab3b13f95c3d44a60577d49eca82fb268f59b33d1312cf5388bdaf949a2865cbf')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENCE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
