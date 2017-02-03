# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=radare2-bindings
pkgver=1.2.0
pkgrel=1
pkgdesc='Language bindings of the radare2 api for valabind and friends'
url='http://radare.org'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('radare2' 'python2' 'python')
makedepends=('valabind')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/radare/radare2-bindings/archive/${pkgver}.tar.gz)
sha512sums=('f7a923688769187d8e55fa81d8d967ec537f051e92e9662054d44ba4a2f0b93630ff77cc30418c5553d15e6646f3cbb24266ad67443fba7394e8d360ee9be623')

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
