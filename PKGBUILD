# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=kbdlight
pkgver=1.3
pkgrel=1
pkgdesc="A very simple application that changes MacBooks' keyboard backlight level."
arch=("x86_64")
url="https://github.com/hobarrera/kbdlight/"
license=('BSD')
source=("https://github.com/hobarrera/$pkgname/archive/v${pkgver}.zip")
md5sums=('a1f8fd0a6e0bc134b4823fa0f831d1b0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr/ install
  chmod 4755 "$pkgdir/usr/bin/$pkgname"
}
