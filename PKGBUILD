# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=fd-rs
pkgver=3.1.0
pkgrel=1
pkgdesc='Simple, fast and user-friendly alternative to find'
arch=('i686' 'x86_64')
url=https://github.com/sharkdp/fd
license=('MIT')
makedepends=('rust')
source=("fd-rs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('67aa9d648b247606da381522ba80f0d48a52d4b9e8c16702d504accb2c1f30a369ef389f424926dce094d74d64561e2e165884d8f3782aae774183978d1fbcf7')

build() {
  cd fd-$pkgver
  cargo build --release
}

check() {
  cd fd-$pkgver
  cargo test --release
}

package() {
  cd fd-$pkgver
  install -Dm755 target/release/fd "$pkgdir"/usr/bin/fd
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/fd-rs/LICENSE
}

# vim:set ts=2 sw=2 et:
