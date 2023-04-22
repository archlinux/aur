# Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

pkgname=hyprland-activewindow
pkgver=0.3.1
pkgrel=1
pkgdesc="A multi-monitor aware Hyprland active window title outputer."
url="https://github.com/FieldofClay/hyprland-activewindow"
makedepends=('cargo')
depends=('hyprland')
arch=('x86_64')
license=('MIT')
source=("https://github.com/FieldofClay/hyprland-activewindow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6bae6d0f42c15cfd9aa9da46869a8f0d686b2a62a1b80d24757746e36aea45e1')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
