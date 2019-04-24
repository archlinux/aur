# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pulldown-cmark
pkgver=0.5.0
pkgrel=1
pkgdesc='Pull parser for CommonMark, written in Rust'
arch=('x86_64')
url=https://github.com/raphlinus/pulldown-cmark
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('8d4d019c07a777b882dc6095fa1eba0f145b1fd25975ac9b10edc3382c06b49ecfa05e2333fbc6c692505e3981fa032174ecaff39c2f157921a6ab9a8eb19691')

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
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
