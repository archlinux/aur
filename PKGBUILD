# Maintainer: 6543 <6543@obermui.de>

pkgname=batmon
pkgdesc="Interactive batteries viewer"
pkgver=0.0.1
pkgrel=0
arch=('x86_64')
url="https://github.com/6543/batmon"
license=('Apache')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/6543/batmon/archive/v${pkgver}.tar.gz")
sha512sums=(
  '2c365a90a6b949cb74a0e3e8e5eff5f77db36b93e4008226703daf9b1a55737ab62f7214d8a908a6966ce3daeb2b2d7bc2e30d11f66380111ec741576f49a69e'
)

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package_batmon() {
  cd "$pkgname-$pkgver"

  install -D -m755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
