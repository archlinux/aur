# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=sealcrypto
pkgver=3.1.0
pkgrel=3
pkgdesc='Simple Encrypted Arithmetic Library'
arch=('x86_64')
url="https://sealcrypto.org/"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/Microsoft/SEAL/archive/${pkgver}.tar.gz")
sha1sums=('09a066ba97c58f2abd5d4e5d0955d29224d563e5')
provides=('sealcrypto')

build() {
  cd ${srcdir}
  tar xf ${pkgver}.tar.gz
  cd SEAL-${pkgver}/src
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr .
  make
}

package() {
  cd ${srcdir}/SEAL-${pkgver}
  install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd src
  make install
}
