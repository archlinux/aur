# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=odt2tex
pkgver=0.0.13
pkgrel=4
pkgdesc="Convert odt files to tex"
url="https://www.chronowerks.de"
arch=('x86_64' 'i686')
license=('MIT')
depends=('libzip' 'expat')
makedepends=('libzip' 'expat')
source=('https://www.chronowerks.de/cgit/odt2tex/snapshot/odt2tex-0.0.13.tar.bz2')
sha512sums=('a28adb32e0fd0ff42ad80b204beb8f350cd753131653407fb8ecf8c12ac2aca995cf398350baeae5ec67e55ddacf0d8c5a6cb64a7bb5952ed2a852d67afff1c0')
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
