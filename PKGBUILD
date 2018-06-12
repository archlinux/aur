# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=dummyhttp
pkgver=0.1.1
pkgrel=1
pkgdesc="Super simple HTTP server that replies a fixed body with a fixed response code
"
arch=('x86_64')
url="https://github.com/svenstaro/dummyhttp"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/dummyhttp/archive/${pkgver}.tar.gz)
sha512sums=('796d2c46d8b7f56baa142013a4208f240976db7826046c4ce536b1873ed66e60eb5299fd209ee446924b79463ade1fa3cf9d362c5634d117fc2ab3cf3f70d09f')

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
