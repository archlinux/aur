# Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

pkgname=hyprland-activewindow
pkgver=1.0.3
pkgrel=1
pkgdesc="A multi-monitor aware Hyprland active window title outputer."
url="https://github.com/FieldofClay/hyprland-activewindow"
makedepends=('cargo')
depends=('hyprland')
arch=('x86_64')
license=('MIT')
source=("https://github.com/FieldofClay/hyprland-activewindow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4d318156067a911dd8c48d39526addabed2702d5e91ed05517bdc99c1b9d3263')

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
