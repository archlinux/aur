# Maintainer: Crestwave <crest.wave@yahoo.com>

pkgname=birch-git
pkgver=r32.c46909f
pkgrel=1
pkgdesc="An IRC client written in pure bash"
arch=('any')
url="https://github.com/dylanaraps/birch"
license=('MIT')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/birch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/birch"
  make DESTDIR="$pkgdir" install
}
