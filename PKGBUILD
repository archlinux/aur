# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=python-btlewrap
_pkgname=btlewrap
pkgver=0.0.9
pkgrel=1
pkgdesc="Bluetooth LowEnergy wrapper for different python backends"
url="https://github.com/ChristianKuehnel/btlewrap"
arch=("any")
license=("MIT")
depends=("python" "python-bluepy")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ChristianKuehnel/btlewrap/archive/v${pkgver}.tar.gz)
sha512sums=("ef15265fac8813bb5837b96ba638dd1635c4d7b3f624091c8722a5c048c20dd496094aacef41d115e25d84356d8b26a47f269c6cd58fd2d41601fca65ab35b06")

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
