# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=dummyhttp
pkgver=0.4.3
pkgrel=1
pkgdesc="Super simple HTTP server that replies a fixed body with a fixed response code"
arch=('x86_64')
url="https://github.com/svenstaro/dummyhttp"
license=(MIT)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/svenstaro/dummyhttp/archive/${pkgver}.tar.gz")
sha512sums=('1d5076baa1d15da3904290b4e2941266fc599c30d71ed09994fa8be1e93e8474d31213fc8dc2616d96eb02d63bb2eba81a49ba5f062aebb1835814ff6392c3aa')

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
