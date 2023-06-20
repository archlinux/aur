# Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

pkgname=hyprland-activewindow
pkgver=0.3.3
pkgrel=1
pkgdesc="A multi-monitor aware Hyprland active window title outputer."
url="https://github.com/FieldofClay/hyprland-activewindow"
makedepends=('cargo')
depends=('hyprland')
arch=('x86_64')
license=('MIT')
source=("https://github.com/FieldofClay/hyprland-activewindow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c31e59da2c0c923544eade073c61b6d788a881df5c1d81e29170b5d2a384168')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
