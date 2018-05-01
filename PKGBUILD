# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=radare2-bindings
pkgver=2.5.0
pkgrel=1
pkgdesc='Language bindings of the radare2 api for valabind and friends'
url='http://radare.org'
arch=('x86_64')
license=('GPL3')
depends=('radare2' 'python2' 'python')
makedepends=('valabind')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/radare/radare2-bindings/archive/${pkgver}.tar.gz)
sha256sums=('f01e1530504a9d52a2ad21edbebb9b68c560b026e35fff406124947b1ea9d483')
sha512sums=('f69023f650b9626d04915edec5a91bf3fd56eb413c4c8c0b936547ef782f6f32a058ec4928111b3c73f8038776f3d19a3cfa8d79ee2ebfa5252f4d4639522b76')

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
