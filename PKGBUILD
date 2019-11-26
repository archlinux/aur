# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=python-miflora
_pkgname=miflora
pkgver=0.4
pkgrel=3
pkgdesc="Library for Xiaomi Mi plant sensor"
url="https://github.com/open-homeautomation/miflora"
arch=("any")
license=("MIT")
depends=("python" "python-btlewrap")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/open-homeautomation/miflora/archive/v${pkgver}.tar.gz)
sha512sums=("8a22c98422030b02c0ec271ce9634211b71f1869fb384560394a29146de2c844a77e29c9f38ed2c9696c9185d4d0b00861f6832cb9ed5d28848e3a9aaba94de1")

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
