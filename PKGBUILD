# Maintainer sgerwk <sgerwk at aol dot com>
# package script file for archlinux
# makepkg -p THISFILE
pkgname=pdftoroff
pkgver=1.1.0
pkgrel=1
pkgdesc="pdf conversion, scaling and viewing by blocks of text"
license=(GPL3)
arch=('x86_64' 'i686')
depends=('poppler-glib' 'ncurses' 'libx11')
makedepends=('gcc' 'make')
url="http://github.com/sgerwk/pdftoroff"
source=(http://github.com/sgerwk/pdftoroff/archive/v$pkgver.tar.gz)
md5sums=('e6acb258a631dd27d3e82723795d08bf')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
}

package() {
  cd $startdir/src/$pkgname-$pkgver
  make DESTDIR=$startdir/pkg/$pkgname install
}
