# Maintainer: Arda Yılmaz <fijarom at fijarom dot com>

pkgname=stutui
pkgver=1.2.0
pkgrel=1
pkgdesc="A minimalist terminal‐based study timer and stopwatch with daily logging, built in C using ncurses."
arch=('x86_64')
url="https://sr.ht/~fijarom/stutui/"
license=('GPL3')
depends=('ncurses')
makedepends=('gcc')

source=("git+https://git.sr.ht/~fijarom/stutui")
sha256sums=('SKIP')

build() {
  cd "$srcdir/stutui"
  gcc stutui.c -o stutui -lncurses
}

package() {
  install -Dm755 "$srcdir/stutui/stutui" "$pkgdir/usr/bin/stutui"
}

