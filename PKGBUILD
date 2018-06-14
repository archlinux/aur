# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=dummyhttp
pkgver=0.2.1
pkgrel=1
pkgdesc="Super simple HTTP server that replies a fixed body with a fixed response code
"
arch=('x86_64')
url="https://github.com/svenstaro/dummyhttp"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/dummyhttp/archive/${pkgver}.tar.gz)
sha512sums=('79397f05a28786feb6adbe8e85b2d786d21b15fa67b2be0c6ac3f9a21df8f9eecd7ad7ba7bf39d4e2e41ec7e8f8404acd1d299fe1d87aba5dd5bf514b1ab764b')

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
