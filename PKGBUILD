# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=diskus
pkgver=0.5.0
pkgrel=1
pkgdesc="Minimal, fast alternative to 'du -sh'"
arch=('x86_64')
url=https://github.com/sharkdp/diskus
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("diskus-$pkgver.tar.gz::https://crates.io/api/v1/crates/diskus/$pkgver/download")
sha512sums=('f2c3cf84732790a8a47bfeee4054f05c4a81f714b2bc0e6ed4db80e1d0ad7449b72382dfdbd266fb9900228c4dd546396ee5af26b3db43b4c2aea1c6ea4ec1ea')

build() {
  cd diskus-$pkgver
  cargo build --release
}

package() {
  cd diskus-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/diskus
  install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/diskus/LICENSE
}

# vim:set ts=2 sw=2 et:
