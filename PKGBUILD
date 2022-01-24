# Maintainer: Brian BIdulock <bidulock@openss7.org>
pkgname=sensible-utils
pkgver=0.0.14
pkgrel=1
pkgdesc="Utilities for sensible alternative selection"
arch=('any')
url="http://packages.debian.org/source/sid/sensible-utils"
license=('GPL')
depends=('bash')
makedepends=('po4a')
checkdepends=('ed')
source=(http://ftp.debian.org/debian/pool/main/s/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('a6ee528bf4122d77acacdb97f20cd0434a12ad3ecd119186a5fcee066844c644')

build() {
# cd $pkgname-$pkgver
  cd $pkgname.git
  export -n EDITOR VISUAL
  ./configure --prefix=/usr
  make
}

check() {
# cd $pkgname-$pkgver
  cd $pkgname.git
  export -n EDITOR VISUAL
  make -k check
}

package() {
# cd $pkgname-$pkgver
  cd $pkgname.git
  export -n EDITOR VISUAL
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
