# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=noise-suppression-for-voice
pkgver=0.91
pkgrel=1
pkgdesc="A real-time noise suppression plugin for voice"
arch=('x86_64')
url="https://github.com/werman/noise-suppression-for-voice"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4f3a112534d4abb5ee2b6c328cde89193dbdb2146cffc98505972c3b5397a35e')
sha512sums=('e117fd54e6cf01c4721b79fddca2f2898331e46764c7a05077ed3034c50e2cbc0c1d6fa3084f7c6f56a629bf20127a7d1bccd57d30b0693cc3eb30edaae6cd28')

prepare() {
  cd ${pkgname}-${pkgver}
  mkdir build
}

build() {
  cd ${pkgname}-${pkgver}/build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=None ..
  make
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
