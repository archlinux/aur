# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=radare2-bindings
pkgver=2.8.0
pkgrel=1
pkgdesc='Language bindings of the radare2 api for valabind and friends'
url='http://radare.org'
arch=('x86_64')
license=('GPL3')
depends=('radare2' 'python2' 'python')
makedepends=('valabind')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/radare/radare2-bindings/archive/${pkgver}.tar.gz)
sha256sums=('4a3b6e8101093033342e862b6834c92072bc6d902583dbca36b45a4684a4d40f')
sha512sums=('920fc3d11923fac14528dac607cb8492889a430c7f0d860e084575c9642f0d92704f8a971c1c8b930ff0273a3410e91c0886f2ef638a9d02025f8d8e37eac73c')

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
