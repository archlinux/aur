pkgname=rofi-wifi
pkgver=1.0.1
pkgrel=1
pkgdesc="Rofi plugin for managing Wi-Fi networks."
arch=('x86_64')
url="https://github.com/bjn7/rofi-wifi"
license=('GPLv3')
depends=('rofi' 'glib2')
makedepends=('git' 'rust' 'cargo' 'clang' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b1986af0d0a7e801f75a69b4038e5271b1165bcb4e2d89325b09e7b41bfbcf5a')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"  
  install -Dm755 "target/release/libwifi.so" "$pkgdir/usr/lib/rofi/libwifi.so"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}