# Maintainer: zocker_160 <zocker1600 at posteo dot net>

pkgname=rehex-git
_gitname=rehex
pkgver=r817.37fc164
pkgrel=2
pkgdesc="A cross-platform (Windows, Linux, Mac) hex editor for reverse engineering, and everything else (git version)"
arch=('x86_64')
url="https://github.com/solemnwarning/rehex"
license=('GPL2')
depends=('jansson' 'capstone' 'wxgtk2' 'lua')
makedepends=('git')
conflicts=('rehex')
source=("git://github.com/solemnwarning/rehex.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_gitname}
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR="$pkgdir" prefix="/usr" install
}
