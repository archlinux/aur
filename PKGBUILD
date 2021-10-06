# Maintainer: Buce <dmbuce@gmail.com>

pkgname=mcexplore-git
pkgver=2.109.g8c2207f+1
pkgver() {
  cd "$srcdir/$pkgname"
  ./mcexplore.py --version | awk '{print $NF}'
}
pkgrel=1
pkgdesc="Use a minecraft server to generate a square of land."
arch=(any)
url="https://github.com/DMBuce/mcexplore"
license=('CCPL:by-sa')
groups=()
depends=(python python-nbt)
provides=(mcexplore)
conflicts=(mcexplore)
makedepends=('git' 'asciidoc')
source=("$pkgname::git+https://github.com/DMBuce/${pkgname%-git}.git")
#source=("$pkgname::git+ssh://git@mantrid/~/${pkgname%-git}.git")
noextract=()
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
  make prefix=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
