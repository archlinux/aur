pkgname=raifetch
pkgver=0.1.2
pkgrel=1
pkgdesc="A Superfast (<5ms) and feature rich System Information Fetch Tool written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/Prithiv-0/raifetch"
license=('GPL3')
depends=()
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Prithiv-0/raifetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5c1c31fa304a00f9eadf6e2c7984e1809ba10ea762736108ebb408780a56ac41')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/raifetch "$pkgdir/usr/bin/raifetch"
  install -Dm644 config/default.toml "$pkgdir/etc/raifetch/config.toml.example"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('5b8b16b8cc0dccaa7ac5b5af47097c85b560f6e6eb14e34300bfdb2e55f40574')
