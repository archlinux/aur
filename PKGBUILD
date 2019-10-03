# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=zola
pkgver=0.9.0
pkgrel=1
pkgdesc="An opinionated static site generator"
arch=('x86_64')
url="https://github.com/getzola/zola"
makedepends=(cargo cmake)
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/getzola/zola/archive/v${pkgver}.tar.gz")
sha256sums=('8d226ec764f2bc06de8e49e2e22ccf37811bc478bbcaa83c2c841b222ef4fc4e')

build() {
  cd zola-$pkgver
  cargo build --release --locked
}

check() {
  cd zola-$pkgver
  cargo test --release --locked
}

package() {
  cd zola-$pkgver
  install -Dm755 target/release/zola "$pkgdir"/usr/bin/zola
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
