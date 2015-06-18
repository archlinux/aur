# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=r2-bindings
_pkgname=radare2-bindings
pkgver=0.9.8
pkgrel=1
pkgdesc="Language bindings of the radare2 api for valabind and friends"
url="http://radare.org"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('radare2' 'python2')
makedepends=('valabind')
options=(!emptydirs)
source=(http://www.radare.org/get/${_pkgname}-${pkgver}.tar.xz)
sha512sums=('e2541340cb180ec87aacbf507ad66b73322bb5b558b2ffdc71c085f2dc767160150b3bbf52ac6590936c5244705b191217b1b2d7ea051d6a78c94988ab684cd8')

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
