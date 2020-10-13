# Maintainer: Pierre Carrier <pierre@gcarrier.fr>
pkgname=sensible-utils
pkgver=0.0.13
pkgrel=1
pkgdesc="Utilities for sensible alternative selection"
arch=('any')
url="http://packages.debian.org/source/sid/sensible-utils"
license=('GPL')
depends=('bash')
makedepends=('po4a')
checkdepends=('ed')
source=(http://ftp.de.debian.org/debian/pool/main/s/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('8627a530e48066282aa81384dddfb38cf53c8470ae7e633c14d2341418fa6298')

build() {
  cd $pkgname-$pkgver
  export -n EDITOR VISUAL
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  export -n EDITOR VISUAL
  make -k check
}

package() {
  cd $pkgname-$pkgver
  export -n EDITOR VISUAL
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
