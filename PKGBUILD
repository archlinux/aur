# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=python-miflora
_pkgname=miflora
pkgver=0.7.2
pkgrel=1
pkgdesc="Library for Xiaomi Mi plant sensor"
url="https://pypi.org/project/miflora"
arch=("any")
license=("MIT")
depends=("python" "python-btlewrap")
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/m/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('ffe1fc8d66cfa2d4995bf77bad5e5390fefe5f04f0bf8e069ecd50decd29b9cef6f2b1a0aa58b19b0496dabb1b2e56eb78651ae0dfae3521606affc011598075')

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
