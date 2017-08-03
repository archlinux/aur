# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=radare2-bindings
pkgver=1.6.0
pkgrel=1
pkgdesc='Language bindings of the radare2 api for valabind and friends'
url='http://radare.org'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('radare2' 'python2' 'python')
makedepends=('valabind')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/radare/radare2-bindings/archive/${pkgver}.tar.gz)
sha256sums=('abc320c4f5353f15d96a40329349253f140f0921074f0d0dbee6b3cb9f0067b8')
sha512sums=('4e5c8b80df838dd9ee778f4e5828dc2b45495570e21f08f0a1763e210c2a5f4ba8c481d97be610541ffa93dfff227701acc5725f93a37c2c2926f55490686f13')

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
