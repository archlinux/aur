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
sha256sums=('9c75549090623a85669b61ef0768c679a953e5e406325be541a798516d91023c')
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