# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=radare2-bindings
pkgver=0.10.1
pkgrel=1
pkgdesc="Language bindings of the radare2 api for valabind and friends"
url="http://radare.org"
arch=('i686' 'x86_64')
license=('GPL3')
repaces=('r2-bindings')
depends=('radare2' 'python2' 'python')
makedepends=('valabind')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/radare/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('e7bd499c1c8403815ef50ffa29ae119db0fce7e33ade41f06c9c534581f2645476ac63003fa985eadd82dc60fe1cc534de1f92d5eba6f17e3d2c748e4a7f7760')

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
