# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=sealcrypto
pkgver=3.6.0
pkgrel=1
pkgdesc='Microsoft library for fully homomorphic encryption'
arch=('x86_64')
url="https://sealcrypto.org/"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/Microsoft/SEAL/archive/${pkgver}.tar.gz")
sha1sums=('154a7355e93035f8cf139e8f051a7af138082dec')

provides=('sealcrypto')

build() {
  cd ${srcdir}
  tar xf ${pkgver}.tar.gz
  cd SEAL-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr .
  make -j
}

package() {
  cd ${srcdir}/SEAL-${pkgver}
  install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  make install
}
