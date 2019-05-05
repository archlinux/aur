# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=zola
pkgver=0.7.0
pkgrel=1
pkgdesc="An opinionated static site generator"
arch=('x86_64')
url="https://github.com/getzola/zola"
makedepends=(cargo cmake)
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/getzola/zola/archive/v${pkgver}.tar.gz")
sha256sums=('6a07a1a08f8b0db50ed87599fca712937004a53ef5950a1d17a1bc3d463a2979')

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
