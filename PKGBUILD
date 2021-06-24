# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=python-miflora
_pkgname=miflora
pkgver=0.7.1
pkgrel=2
pkgdesc="Library for Xiaomi Mi plant sensor"
url="https://pypi.org/project/miflora"
arch=("any")
license=("MIT")
depends=("python" "python-btlewrap")
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/m/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('069e4133fbd13db6deb19ef6b37ccc8663ca5d9026bc5f4894eb89c1f50dc5cc72695052c30c20857875503019d37ff49615fd1576282e9ce06ce3eff4673cd3')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --skip-build -O1 --root="${pkgdir}"

  rm -Rf ${pkgdir}/usr/lib/*/site-packages/test/
}

# vim: ts=2 sw=2 et:
