# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: Brian BIdulock <bidulock@openss7.org>
pkgname=sensible-utils
pkgver=0.0.17
_debianextra=+nmu1
pkgrel=1
pkgdesc="Utilities for sensible alternative selection"
arch=('any')
url="http://packages.debian.org/source/sid/sensible-utils"
license=('GPL')
depends=('bash')
makedepends=('po4a')
checkdepends=('ed')
source=(http://ftp.debian.org/debian/pool/main/s/$pkgname/${pkgname}_${pkgver}${_debianextra}.tar.xz)
sha256sums=('a4ead62e0dc8f965453221dcb09c964abc4f1bedad24f527d33c443a1570cb31')

build() {
  cd ${pkgname}-${pkgver}${_debianextra}
  export -n EDITOR VISUAL
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}${_debianextra}
  export -n EDITOR VISUAL
  make -k check
}

package() {
  cd ${pkgname}-${pkgver}${_debianextra}
  export -n EDITOR VISUAL
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
