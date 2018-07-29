# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=dummyhttp
pkgver=0.2.2
pkgrel=1
pkgdesc="Super simple HTTP server that replies a fixed body with a fixed response code
"
arch=('x86_64')
url="https://github.com/svenstaro/dummyhttp"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/dummyhttp/archive/${pkgver}.tar.gz)
sha512sums=('3c1d645abd80945eb666641a4102ffa7a9e074f57a6d76c4f0af4e0b854e5bd3e9cd92768be980723bf39393be66a793b018f38916260fec04bb200f593cab40')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/dummyhttp "$pkgdir"/usr/bin/dummyhttp
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
