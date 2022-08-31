# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=clock-tui
pkgver=0.4.0
pkgrel=1
pkgdesc="A clock, timer, and stopwatch for your terminal"
arch=("x86_64")
url="https://github.com/race604/clock-tui"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ca09b45aede3c6c3ad51d82977576a2a63039d1942b4177ea438a5501b183435')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/tclock" "$pkgdir/usr/bin/tclock"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

