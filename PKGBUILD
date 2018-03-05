# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=rink
pkgver=0.4.3
pkgrel=1
pkgdesc='Unit conversion tool and library written in rust'
arch=('x86_64')
url=https://github.com/tiffany352/rink-rs
license=('Custom:MPLv2' 'GPL3')
depends=('gcc-libs' 'gmp' 'openssl')
makedepends=('rust')
source=("rink-$pkgver.tar.gz::https://crates.io/api/v1/crates/rink/$pkgver/download")
sha512sums=('f2af9c2f78a230f0b94789c7e1308fc4d619ac9a04381ef60452f71e95f5ae591a897eaa1bb85286e7a191af209fd9a40e035a06360fde629fe63f4f0e3e9c32')

build() {
  cd rink-$pkgver
  cargo build --release
}

check() {
  cd rink-$pkgver
  cargo test --release
}

package() {
  cd rink-$pkgver
  install -Dm644 LICENSE-MPL "$pkgdir"/usr/share/licenses/rink/LICENSE
  install -Dm755 target/release/rink "$pkgdir"/usr/bin/rink
}

# vim:set ts=2 sw=2 et:
