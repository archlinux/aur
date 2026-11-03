# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-taproot
pkgver=0.2.0
pkgrel=1
pkgdesc="Auto-generate a full GraphQL API from a PostgreSQL database"
arch=('x86_64')
url="https://taproot.omni.dev"
license=('Apache-2.0')
depends=()
makedepends=('cargo')
source=("https://github.com/omnidotdev/taproot/archive/v$pkgver.tar.gz")

build() {
  cd "taproot-$pkgver"
  cargo build --release --bin taproot
}

package() {
  cd "taproot-$pkgver"
  install -Dm755 "target/release/taproot" "$pkgdir/usr/bin/taproot"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('40a7897a606d718eb32d5a3453af1254a8b0c5790d851e97e88c8dbe686ae153')
