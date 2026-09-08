# Maintainer: Aneesh Sambu <sambuaneesh@gmail.com>

pkgname=codex-shwap
pkgver=0.1.0
pkgrel=1
pkgdesc='Secure, keyboard-first TUI account switcher for Codex'
arch=('x86_64')
url='https://github.com/sambuaneesh/codex-shwap'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('codex-shwap-bin')
provides=("$pkgname=$pkgver")
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14ec5812a5c380b8b2489657977ff88c88d72f88873617893f444738f4bc094d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/codex-shwap "$pkgdir/usr/bin/codex-shwap"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
