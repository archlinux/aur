# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=radare2-bindings
pkgver=1.0.1
pkgrel=1
pkgdesc='Language bindings of the radare2 api for valabind and friends'
url='http://radare.org'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('radare2' 'python2' 'python')
makedepends=('valabind')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/radare/radare2-bindings/archive/${pkgver}.tar.gz)
sha512sums=('a023d36f381cb70d36ed63580f6b369968d5e2a60a059523b5960af1810cefb2e52fc6edbd52be29ac940b0dd31772cc9ff3f96a9f6a78fb42dc43d604a48e7e')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable=ctypes --enable=python
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
