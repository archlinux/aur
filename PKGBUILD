# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=clock-tui
pkgver=0.5.0
pkgrel=1
pkgdesc="A clock, timer, and stopwatch for your terminal"
arch=("x86_64")
url="https://github.com/race604/clock-tui"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1f592ca74e84d39bcd6f31a69f368422a68e4c9f2d786a193faaae49a389f392')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/tclock" "$pkgdir/usr/bin/tclock"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

