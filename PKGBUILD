# Maintainer: Arda Yılmaz <fijarom at fijarom dot com>

pkgname=stutui
pkgver=1.2.2
pkgrel=3
pkgdesc="A minimalist terminal‐based study timer and stopwatch with daily logging, built in C"
arch=('x86_64')
url="https://sr.ht/~fijarom/stutui/"
license=('GPL-3.0-or-later')
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
  install -Dm644 "$srcdir/$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

