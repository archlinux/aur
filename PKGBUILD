# Maintainer: Drevet Olivier <odrevet at gmail dot com>
pkgname=gjitenkai-git
pkgver=0.1
pkgrel=1
pkgdesc="Rewrited and enchanced gjiten - a Gnome Japanese Dictionary"
arch=('i686')
license=('GPL')
depends=('gtk3')
makedepends=('git' 'cmake')
source=("git://github.com/odrevet/gjitenkai.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/gjitenkai"
  mkdir -p ./bin
  cmake -DCMAKE_BUILD_TYPE=Release . 
  make
}

package() {
  cd "$srcdir/gjitenkai"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
