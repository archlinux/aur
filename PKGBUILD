# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=python-miflora
_pkgname=miflora
pkgver=0.7.1
pkgrel=1
pkgdesc="Library for Xiaomi Mi plant sensor"
url="https://pypi.org/project/miflora"
arch=("any")
license=("MIT")
depends=("python" "python-btlewrap")
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/m/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('1db3d8c82aea18c860795e968dfbfbd5e60002872db833362d88136201c73742d9bd94c8bc6f47cacf882a7a98e1b2ce2a6a7def213609989afa468182cf3853')

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
