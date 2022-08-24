# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=clock-tui
pkgver=0.3.2
pkgrel=1
pkgdesc="A clock, timer, and stopwatch for your terminal"
arch=("x86_64")
url="https://github.com/race604/clock-tui"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6ecfa0bddc468c4f882e0ab0be61e85c2b2d4a9d036264bd29aed74deaad1ca4')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/tclock" "$pkgdir/usr/bin/tclock"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

