# Maintainer: hongnoul <namyang@mit.edu>
pkgname=hwatu
pkgver=0.5.0
pkgrel=1
pkgdesc="Visual verification browser for AI coding agents: daemon-based WebKitGTK, real rendering, ~13ms window spawn"
arch=('x86_64')
url="https://github.com/hongnoul/hwatu"
license=('MIT')
depends=('webkitgtk-6.0' 'gtk4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hongnoul/hwatu/archive/v$pkgver.tar.gz")
sha256sums=('ca1a78e4837381be013c2ec83198dd1335ef307c38c76c5f9a653b13630d8b50')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/hwatu "$pkgdir/usr/bin/hwatu"
  install -Dm755 target/release/hwatud "$pkgdir/usr/bin/hwatud"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
