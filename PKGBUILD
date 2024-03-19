# Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

pkgname=hyprland-workspaces
pkgver=2.0.0
pkgrel=1
pkgdesc="A multi-monitor aware Hyprland workspace widget for use with bars."
url="https://github.com/FieldofClay/hyprland-workspaces"
makedepends=('cargo')
depends=('hyprland')
arch=('x86_64')
license=('MIT')
install=hyprland-workspaces.install
source=("https://github.com/FieldofClay/hyprland-workspaces/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b042f4c257a82b35346f9f5d21f93199c019a5a921d6451e3ac00f887e70c2ff')

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
