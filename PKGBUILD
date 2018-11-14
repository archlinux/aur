# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=diskus
pkgver=0.4.0
pkgrel=1
pkgdesc="Minimal, fast alternative to 'du -sh'"
arch=('x86_64')
url=https://github.com/sharkdp/diskus
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("diskus-$pkgver.tar.gz::https://crates.io/api/v1/crates/diskus/$pkgver/download")
sha512sums=('815674c14bfd118e25f61b76ebf2131f719343c1efeb94e2a8bd5c4caa378532e3123a0afbfa1b48ccc5f178e7576c199a554636058cda9d9e4c7d1699f08865')

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
