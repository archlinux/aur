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
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
