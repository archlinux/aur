# Maintainer: El Bachir <bachiralfa@gmail.com>
#
pkgname=conway-screensaver
pkgver=1.0.2
pkgrel=1
pkgdesc="Conway's Game of Life (Terminal Screensaver)"
arch=('x86_64')
url="https://github.com/cdkw2/conway-screensaver"
license=('MIT')
depends=('glibc' 'ncurses')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cdkw2/conway-screensaver/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f8598fa30f89b1a1c2d8cf7236768c7fa39e0a5090a3a76e2ed5fef2266f51b0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "conway-screensaver" "$pkgdir/usr/bin/conway-screensaver"
  mkdir -p "$HOME/.config/conway-screensaver"
  install -Dm644 "game_of_life.conf" "$HOME/.config/conway-screensaver/game_of_life.conf"
}
