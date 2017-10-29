# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=pulldown-cmark
pkgver=0.1.0
pkgrel=1
pkgdesc='Pull parser for CommonMark, written in Rust'
arch=('x86_64')
url=https://github.com/google/pulldown-cmark
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('1635b1696ddf04977ef2dc8fd08127b5434b1e091e5da8d5bbce4b1e9d660918d8fd56645ea5ca152392cc7e722b8ec78e47f37e21756080412fe4fa75c60299')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

check() {
  cd $pkgname-$pkgver
  cargo test --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
