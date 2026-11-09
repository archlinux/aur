# Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

pkgname=hyprland-activewindow
pkgver=2.0.0
pkgrel=1
pkgdesc="A multi-monitor aware Hyprland active window title outputer."
url="https://github.com/FieldofClay/hyprland-activewindow"
makedepends=('cargo')
depends=('hyprland')
arch=('x86_64')
license=('MIT')
source=("https://github.com/FieldofClay/hyprland-activewindow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f84b3f8a9e96efec35eb9bface3c9bb40d9e5e9ffde784ac02e287c4ca4aaeab')

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
