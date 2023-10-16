# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
pkgname=arpackpp
pkgver=2.4.0
pkgrel=1
pkgdesc="Arpack++ with patches (C++ interface to ARPACK)"
arch=(x86_64)
url="http://reuter.mit.edu/software/arpackpatch"
license=('custom:BSD-3-clause')
depends=(arpack)
optdepends=(superlu suitesparse)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/m-reuter/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('aad43cc6bea1e8a4321b0bdfd582038ab8072955cfa001af4d4de9b73efdde054681963fcf639c1a170b6a884ab5ff2a8e19b7d7cb067d53e6f0ad27c51dc19a')
b2sums=('8f806988d2f98fdbcd29b8bbb6d9c6b75fac592b3e9d1ad5d5d7f3618e74224f78d019f81bd37034ea8e36730f48a58b041d46c036206860af2437a4e059207e')

package() {
  cd ${pkgname}-${pkgver}

  # install headers
  install -d ${pkgdir}/usr/include/arpack++
  install include/*.h ${pkgdir}/usr/include/arpack++

  # install docs
  install -d ${pkgdir}/usr/share/doc/arpack++
  install doc/* ${pkgdir}/usr/share/doc/arpack++

  # install tutorials
  install -d ${pkgdir}/usr/share/arpack++/examples
  cp -r examples/* ${pkgdir}/usr/share/arpack++/examples

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
