# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=dummyhttp
pkgver=0.3.1
pkgrel=1
pkgdesc="Super simple HTTP server that replies a fixed body with a fixed response code"
arch=('x86_64')
url="https://github.com/svenstaro/dummyhttp"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/dummyhttp/archive/${pkgver}.tar.gz)
sha512sums=('229832fdb100404aa0413c8a15983e2de2089b37d2c0b33a5e466b6e217049b7257203200d676bd3dcaed4efca5720bce0cbcf2ad77eebec66864ac0d0edd97b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/dummyhttp "$pkgdir"/usr/bin/dummyhttp
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
