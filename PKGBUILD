# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=gutenberg
pkgver=0.2.1
pkgrel=1
pkgdesc="An opinionated static site generator"
arch=('i686' 'x86_64')
url="https://github.com/Keats/gutenberg"
makedepends=('cargo')
license=('MIT')
source=("https://github.com/Keats/gutenberg/archive/v${pkgver}.tar.gz")
sha256sums=('407097164b1d6807e7dca94d68fba7538b0a85f8cf08448c4a5ca3357cfd00ca')

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
