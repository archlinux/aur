# Maintainer: Rowan Lewis <rl@nbsp.io>

pkgname=dsplight
pkgver=1.0
pkgrel=2
pkgdesc="A very simple application that changes MacBooks' with Intel graphics display backlight level."
arch=("x86_64")
url="https://github.com/psychoticmeow/dsplight/"
license=('BSD')
source=("https://github.com/psychoticmeow/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('59fe6a49f3649340a684c09a5c288ff058b209a8355310331bac221c49645f4f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr/ install
  chmod 4755 "$pkgdir/usr/bin/$pkgname"
}
