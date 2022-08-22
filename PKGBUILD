# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=7clock
pkgver=0.1.0
pkgrel=1
pkgdesc="A seven-segment display style clock for your terminal"
arch=("x86_64")
url="https://github.com/wezm/7clock"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2df08d71b0c5dfb85e379ff629af6c40719a4cb305ac39068e4bb45109a9c040')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/7clock" "$pkgdir/usr/bin/7clock"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

