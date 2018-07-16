# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=radare2-bindings
pkgver=2.7.0
pkgrel=1
pkgdesc='Language bindings of the radare2 api for valabind and friends'
url='http://radare.org'
arch=('x86_64')
license=('GPL3')
depends=('radare2' 'python2' 'python')
makedepends=('valabind')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/radare/radare2-bindings/archive/${pkgver}.tar.gz)
sha256sums=('df9537fd4b1bc0474fa4abba1c87687239003c047987e155ec1483a0ce988d0f')
sha512sums=('fd25f9b79a8e03902d1da6626986801143ac68ec96d704c3e49859cb241d5e208e926c40ef79b428055061cc05e0b576e7f34d69f9ef59bf8858b847dfedb315')

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --enable=ctypes \
    --enable=python
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
