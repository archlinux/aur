# Maintainer: darrkenn <darrkenn08@gmail.com>
pkgname="kitty-cat"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="kitty-cat is a command line tool that fetches a cat from CATAAS and displays it in your terminal. Built for Kitty terminal."
arch=('x86_64')
url=""
license=('MIT')
depends=('kitty')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/darrkenn/kitty-cat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f5f03c4cfbdac31d9f5e11422d0f695af0f88943db58c8250f7392d397ceca90')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
