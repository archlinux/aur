# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=python-miflora
_pkgname=miflora
pkgver=0.6
pkgrel=1
pkgdesc="Library for Xiaomi Mi plant sensor"
url="https://pypi.org/project/miflora"
arch=("any")
license=("MIT")
depends=("python" "python-btlewrap")
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/m/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('d19faeecdc75732c09f7912b9c234e0841c6a9a761e01592b5a542a10815d5a970edc09fc1c264d9cd31264975217c721b8be111fa2aa29a26b06e1f745ca44c')

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
