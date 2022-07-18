# Maintainer: zocker_160 <zocker1600 at posteo dot net>

pkgname=rehex-git
_gitname=rehex
pkgver=r1212.43804c5
pkgrel=1
pkgdesc="A cross-platform (Windows, Linux, Mac) hex editor for reverse engineering, and everything else (git version)"
arch=('x86_64')
url="https://github.com/solemnwarning/rehex"
license=('GPL2')
depends=('jansson' 'capstone' 'wxgtk3' 'lua>=5.3')
makedepends=('git' 'zip' 'perl-template-toolkit' 'busted')
conflicts=('rehex')
source=("git+https://github.com/solemnwarning/rehex.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  
  make prefix="/usr"
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" prefix="/usr" install
}
