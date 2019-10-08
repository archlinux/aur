# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=proxyboi
pkgver=0.4.1
pkgrel=1
pkgdesc="A super simple reverse proxy with TLS support"
arch=('x86_64')
url="https://github.com/svenstaro/proxyboi"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/proxyboi/archive/${pkgver}.tar.gz)
sha512sums=('a4b8b4be7445da1eea7d794071f6bf5e8fb123787f025aeb2ef95747733e604a33f68936e90cfaa311310f9f4144167015fc3db9b6a3def1611228ca0140c776')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/proxyboi "$pkgdir"/usr/bin/proxyboi
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
