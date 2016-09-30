# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=radare2-bindings
pkgver=0.10.6
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
sha512sums=('7505eaffb655562f0431f88c5f8c022574b387ebf80282e6a2f338384fe2a0cece89ec1fa076f16f8bf958b82255b6d99cc431e27e0fd39b3542ef5a3b0a605e')

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
