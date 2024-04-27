# Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

pkgname=hyprland-activewindow
pkgver=1.0.2
pkgrel=1
pkgdesc="A multi-monitor aware Hyprland active window title outputer."
url="https://github.com/FieldofClay/hyprland-activewindow"
makedepends=('cargo')
depends=('hyprland')
arch=('x86_64')
license=('MIT')
source=("https://github.com/FieldofClay/hyprland-activewindow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c70003b298095a7d7e159f5bc6b6b9adc74917b7deefab52a92e6cd2f522931')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
