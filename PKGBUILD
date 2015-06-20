# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=r2-bindings
_pkgname=radare2-bindings
pkgver=0.9.9
pkgrel=1
pkgdesc="Language bindings of the radare2 api for valabind and friends"
url="http://radare.org"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('radare2' 'python2' 'python')
makedepends=('valabind')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/radare/${_pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('e7bd499c1c8403815ef50ffa29ae119db0fce7e33ade41f06c9c534581f2645476ac63003fa985eadd82dc60fe1cc534de1f92d5eba6f17e3d2c748e4a7f7760')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --enable=ctypes --enable=python
  make
}
 
package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
 
# vim: ts=2 sw=2 et:
