# Maintainer: Pierre Carrier <pierre@gcarrier.fr>
pkgname=sensible-utils
pkgver=0.0.12
pkgrel=1
pkgdesc="Utilities for sensible alternative selection"
arch=('any')
url="http://packages.debian.org/source/sid/sensible-utils"
license=('GPL')
depends=('bash')
makedepends=('po4a')
source=(http://ftp.de.debian.org/debian/pool/main/s/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('99ba2ebf8c57447c69d426b99b84ff9dc817be0bc4988ec6890a14558c529e2e')

build() {
  cd $pkgname.git
  export -n EDITOR VISUAL
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname.git
# need --nocheck for makechrootpkg inpite of this
  export -n EDITOR VISUAL
  make -k check
}

package() {
  cd $pkgname.git
  export -n EDITOR VISUAL
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
