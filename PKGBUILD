# Maintainer: mlq <mlq@pwmt.org>

pkgname=termbox-git
pkgver=0730826
pkgrel=1
pkgdesc="termbox library (ncurses alternative)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/termbox/"
license=('custom')
makedepends=('git' 'python')
source=('termbox::git+https://github.com/nsf/termbox.git')
sha1sums=('SKIP')
_gitname='termbox'
options=(staticlibs)

prepare() {
  cd "$srcdir/$_gitname"
  ./waf configure --prefix=/usr
}

build() {
  cd "$srcdir/$_gitname"
  ./waf
}

package() {
  cd "$srcdir/$_gitname"
  ./waf install --destdir=$pkgdir
}

pkgver() {
  cd "$_gitname"
  local ver="$(git describe --long --always)"
  printf "%s" "${ver//-/.}"
}

# vim:set ts=2 sw=2 et:
