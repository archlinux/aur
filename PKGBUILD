# Maintainer sgerwk <sgerwk at aol dot com>
# package script file for archlinux
# makepkg -p THISFILE
pkgname=pdftoroff
pkgver=git
pkgrel=1
pkgdesc="pdf conversion, scaling and viewing by blocks of text"
license=(GPL3)
arch=('x86_64' 'i686')
depends=('poppler-glib' 'ncurses' 'libx11')
makedepends=('gcc' 'make')
url="http://github.com/sgerwk/pdftoroff"
source=(git+https://github.com/sgerwk/pdftoroff)
sha256sums=('SKIP')

build() {
  cd $startdir/src/$pkgname
  make || return 1
}

check() {
  cd $startdir/src/$pkgname
  return $(test -x hovacui)
}

package() {
  cd $startdir/src/$pkgname
  make DESTDIR=$startdir/pkg/$pkgname install
}
