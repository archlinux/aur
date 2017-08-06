# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=fd-rs
pkgver=2.0.0
pkgrel=1
pkgdesc='Simple, fast and user-friendly alternative to find'
arch=('i686' 'x86_64')
url=https://github.com/sharkdp/fd
license=('MIT')
makedepends=('cargo')
source=("fd-rs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5a03885e31f7c8240df39370fb257d8ad4320bed7eae847abe89b6184f989ab509bf6fe5dde02673d5ba067a2c50020fbe7676d8a0377c3c8fa3b12375f32aa2')

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
