# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=dup-rs
pkgver=0.2.0
pkgrel=1
pkgdesc="A minimal, fast alternative to 'du -sh'"
arch=('x86_64')
url=https://github.com/sharkdp/dup
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("du-dup-$pkgver.tar.gz::https://crates.io/api/v1/crates/du-dup/$pkgver/download")
sha512sums=('3a5982fa83a09f24ea8fa2fc70acd6bbb777da7a6c45b6c90e0c8283b8b67db5f2946ae6e75fb01578a9817ddaa1e192a28f60fd2ee2983bf812717896e3e319')

build() {
  cd du-dup-$pkgver
  cargo build --release
}

package() {
  cd du-dup-$pkgver
  install -Dm755 target/release/dup "$pkgdir"/usr/bin/dup
  install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/dup-rs/LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
