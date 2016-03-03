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
sha512sums=('29e9ea88666c0c2b1d75c80dfb203ba8bf8b7af9236d34452f7e2d59d21a6f31cd90f8302f28d6823299d5a5123e57ed7e6560e5cd0136f854bd4002075594c5')

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
