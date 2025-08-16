# Maintainer: Arda Yılmaz <fijarom at fijarom dot com>

pkgname=stutui
pkgver=1.2.1
pkgrel=2
pkgdesc="A minimalist terminal‐based study timer and stopwatch with daily logging, built in C."
arch=('x86_64')
url="https://sr.ht/~fijarom/stutui/"
license=('GPL3')
depends=('ncurses')
makedepends=('gcc')

source=("git+https://git.sr.ht/~fijarom/stutui")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  gcc $pkgname.c -o $pkgname -lncurses
}

package() {
  install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

