# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=dummyhttp
pkgver=0.4.1
pkgrel=1
pkgdesc="Super simple HTTP server that replies a fixed body with a fixed response code"
arch=('x86_64')
url="https://github.com/svenstaro/dummyhttp"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/dummyhttp/archive/${pkgver}.tar.gz)
sha512sums=('711c60ab0125ee3aeeb69cd51ff3c81075ab3fef1db0632979a9da3e87110e352e7fa0a6305719842fd76f71316e20d0a3d30f2695bce0ce7837421548ae2efa')

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
