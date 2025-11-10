# Maintainer: Nicolass Tibi <ntibi at protonmail dot com>
pkgname=timestamp-tool
pkgver=0.1.0
pkgrel=1
pkgdesc="Timestamp utility for unix timestamps"
arch=('x86_64')
url="https://github.com/ntibi/timestamp-tool"
license=('MIT')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/timestamp "$pkgdir/usr/bin/timestamp"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
