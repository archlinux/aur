# Maintainer: Christian Rebischke <Chris.Rebischke[at]archlinux[dot]org>
pkgname=libemu
pkgver=1.0.1
pkgrel=2
pkgdesc="A small library written in c offering basic x86 emulation and shellcode detection"
arch=('i686' 'x86_64')
url="https://github.com/buffer/libemu"
license=('GPL2')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/buffer/$pkgname/archive/v${pkgver}.tar.gz")
sha512sums=('92face388179ed019b874f2d909c71ed5bbef6690fa0a1f3280e1bfb6574ba154ee7c14888b7d2abe65303c7a0a9c67f587b85bfe4082766b043c298f9e81f6b')

build() {
  cd "${pkgname}-${pkgver}"
  autoreconf -v -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set et sw=2 ts=2 tw=79:
