# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=dummyhttp
pkgver=0.2.0
pkgrel=1
pkgdesc="Super simple HTTP server that replies a fixed body with a fixed response code
"
arch=('x86_64')
url="https://github.com/svenstaro/dummyhttp"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/dummyhttp/archive/${pkgver}.tar.gz)
sha512sums=('2c3922961636a877cb39a55e303131bd7972c97ea69f11e2fb3822b834ed86fbad1c3ca27498388d8f41f1fe11f5df3f58f6504107217976e91a07ba16a2a37b')

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
