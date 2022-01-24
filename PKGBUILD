# Maintainer: zocker_160 <zocker1600 at posteo dot net>

pkgname=rehex-git
_gitname=rehex
pkgver=r970.10fe1ef
pkgrel=1
pkgdesc="A cross-platform (Windows, Linux, Mac) hex editor for reverse engineering, and everything else (git version)"
arch=('x86_64')
url="https://github.com/solemnwarning/rehex"
license=('GPL2')
depends=('jansson' 'capstone' 'wxgtk2' 'lua')
makedepends=('git' 'zip' 'perl-template-toolkit')
conflicts=('rehex')
source=("git://github.com/solemnwarning/rehex.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" prefix="/usr" install
}
