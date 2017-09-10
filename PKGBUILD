# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=fd-rs
pkgver=3.0.0
pkgrel=1
pkgdesc='Simple, fast and user-friendly alternative to find'
arch=('i686' 'x86_64')
url=https://github.com/sharkdp/fd
license=('MIT')
makedepends=('cargo')
source=("fd-rs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0ee060df705ae7271db5a4dec3cc2c89968931ffe237da1abf1dc778670e998247227a564932217709508f8b374391ce1821d344bb080337b418b5b14f32f1a4')

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
