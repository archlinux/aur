# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=wasmer
pkgver=0.3.0
pkgrel=1
pkgdesc="Universal Binaries Powered by WebAssembly"
arch=('x86_64')
url="https://github.com/wasmerio/wasmer"
license=(MIT)
makedepends=(cargo cmake python)
source=(https://github.com/wasmerio/wasmer/archive/${pkgver}.tar.gz)
sha512sums=('ca3ee4e7c893d7d3b66072b8ed5e8e38ce0a52d36bd3a9d68957f9c8fd7acaa23424258978bee32357118c9deec2ec1bdf4025d380b2ea95b70dc985da8fc2db')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  # Currently broken
  # make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/wasmer "$pkgdir"/usr/bin/wasmer
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
