# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=odt2tex
pkgver=0.0.13
pkgrel=5
pkgdesc="Convert odt files to tex"
url="https://www.chronowerks.de/odt"
arch=('x86_64' 'i686')
license=('MIT')
depends=('libzip' 'expat')
makedepends=('libzip' 'expat')
source=("${url}/release/${pkgname}-${pkgver}.src.tar.bz2")
sha512sums=('f859819bb32c22a0e5d9d510ceba0bdf99769c60be78f230492ab3663c7b66268689d3f0b3a71f595d586722b43d67a0265353f5e14ac34054ebe92b98598bb5')
 
build() {
  cd "${srcdir}/${pkgname}"
  make
}
 
package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
