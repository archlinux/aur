# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-kiln
pkgver=0.1.0
pkgrel=1
pkgdesc="Zero-config source-to-image container builder"
arch=('x86_64')
url="https://kiln.omni.dev"
license=('Apache-2.0')
depends=()
makedepends=('cargo')
source=("https://github.com/omnidotdev/kiln/archive/v$pkgver.tar.gz")

build() {
  cd "kiln-$pkgver"
  cargo build --release
}

package() {
  cd "kiln-$pkgver"
  install -Dm755 "target/release/kiln" "$pkgdir/usr/bin/kiln"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('1717e0faf4f49da293585b921e32c0654fc1ecd5eaf769f29446db3070ad095b')
