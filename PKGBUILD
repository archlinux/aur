# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=radare2-bindings
pkgver=0.10.2
pkgrel=1
pkgdesc="Language bindings of the radare2 api for valabind and friends"
url="http://radare.org"
arch=('i686' 'x86_64')
license=('GPL3')
replaces=('r2-bindings')
depends=('radare2' 'python2' 'python')
makedepends=('valabind')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/radare/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('7e17e2e5827b6ce3ab756bd5bc20c3c8d57a660234f9c82b5f4717c427f02beb43b88203bc326ca1bba60b73feaa6a26652c93778b7b7cdd7355619dd05016fd')

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
