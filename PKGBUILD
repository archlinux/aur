# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=odt2tex
pkgver=0.0.13
pkgrel=3
pkgdesc="Convert odt files to tex"
url="https://www.chronowerks.de"
arch=('x86_64' 'i686')
license=('MIT')
depends=('libzip' 'expat')
makedepends=('libzip' 'expat')
source=("git+https://www.chronowerks.de/cgit/odt2tex.git")
 
build() {
  cd "${srcdir}/${pkgname}"
  git checkout ${pkgver}
  make
}
 
package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
sha512sums=('SKIP')
