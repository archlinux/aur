# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=gutenberg
pkgver=0.4.2
pkgrel=1
pkgdesc="An opinionated static site generator"
arch=('x86_64')
url="https://github.com/Keats/gutenberg"
makedepends=(cargo cmake)
license=('MIT')
source=("https://github.com/Keats/gutenberg/archive/v${pkgver}.tar.gz")
sha256sums=('8d3fb9972a17f6fa8a7830c8d129a7d587f0bbfc36f5351dc4c9e44f46aa4e2d')

build() {
  cd gutenberg-$pkgver
  cargo build --release
}

check() {
  cd gutenberg-$pkgver
  cargo test --release
}

package() {
  cd gutenberg-$pkgver
  install -Dm755 target/release/gutenberg "$pkgdir"/usr/bin/gutenberg
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
