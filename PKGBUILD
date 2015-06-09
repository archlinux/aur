# Maintainer: Rowan Lewis <rl@nbsp.io>

pkgname=dsplight
pkgver=1.0
pkgrel=1
pkgdesc="A very simple application that changes MacBooks' with Intel graphics display backlight level."
arch=("x86_64")
url="https://github.com/psychoticmeow/dsplight/"
license=('BSD')
source=("https://github.com/psychoticmeow/$pkgname/archive/v${pkgver}.zip")
md5sums=('952f752e3399a41b6784a8adbadf528f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr/ install
  chmod 4755 "$pkgdir/usr/bin/$pkgname"
}
