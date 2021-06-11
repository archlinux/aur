# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=python-btlewrap
_pkgname=btlewrap
pkgver=0.1.0
pkgrel=1
pkgdesc="Bluetooth LowEnergy wrapper for different python backends"
url="https://github.com/ChristianKuehnel/btlewrap"
arch=("any")
license=("MIT")
depends=("python" "python-bluepy")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ChristianKuehnel/btlewrap/archive/v${pkgver}.tar.gz)
sha512sums=('bcfd0631e466240b8c36728726c1010023e45d95b248c88c6378fa42dc6213037fd1fbb8189a034f3250876d021e6b74804f35ba047149a6472788221688e2f9')

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
