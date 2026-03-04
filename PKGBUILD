# Maintainer: Nick <nxckmusicprod@gmail.com>
pkgname=cybergrind-git
pkgver=r61.35b80ff
pkgrel=1
pkgdesc="A terminal-based idle game with a cyberpunk theme"
arch=('x86_64')
url="https://github.com/nxck2005/whiletrue"
license=('Apache')
depends=('ncurses')
makedepends=('git' 'gcc' 'make')
provides=('cybergrind')
conflicts=('cybergrind')
source=('cybergrind::git+https://github.com/nxck2005/whiletrue.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/cybergrind"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/cybergrind"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/cybergrind"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
