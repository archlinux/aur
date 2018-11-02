# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=diskus
pkgver=0.3.0
pkgrel=1
pkgdesc="A minimal, fast alternative to 'du -sh'"
arch=('x86_64')
url=https://github.com/sharkdp/diskus
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("diskus-$pkgver.tar.gz::https://crates.io/api/v1/crates/diskus/$pkgver/download")
sha512sums=('9d60c2817bd03d2157b1523307b856e87f3d5251fd6241606ae5b5bdb4c19e4a5b2a7f75fe404f3ff385e1fa75bb7f3ef2871abb3d9139efb594a170e8855f96')

build() {
  cd diskus-$pkgver
  cargo build --release
}

package() {
  cd diskus-$pkgver
  install -Dm755 target/release/diskus "$pkgdir"/usr/bin/diskus
  install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/diskus/LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
