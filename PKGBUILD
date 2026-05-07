# FOR otaripper/PKGBUILD
pkgname=otaripper
pkgver=2.3.0
pkgrel=1
pkgdesc="Ultra-fast partition extractor for Android OTA files (source)"
arch=('x86_64' 'aarch64')
url="https://github.com/syedinsaf/otaripper"
license=('Apache-2.0')
makedepends=('rust')
provides=('otaripper')
conflicts=('otaripper-bin' 'otaripper-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c9c59b581d5fcf737a79073b66e9cb667a7b93aeec232810c5e1e48590ac9040')
build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}
package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/otaripper" "$pkgdir/usr/bin/otaripper"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/otaripper/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/otaripper/README.md"
}