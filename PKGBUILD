# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=hyperlink
pkgver=0.1.13
pkgrel=1
pkgdesc='Command-line tool to find broken links in your static site'
arch=('x86_64')
url=https://github.com/untitaker/hyperlink
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('697cefd45a5b981c6a7f0bd4e8d2a415320c72c2c374492d1e48382d07c2ba3a5b4f3648d3da411ff5759cd2693a5a2a1ac823fe5e9406de7f97e3f8a61f0401')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/hyperlink
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
