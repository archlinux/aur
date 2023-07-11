# Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

pkgname=hyprland-workspaces
pkgver=1.2.2
pkgrel=1
pkgdesc="A multi-monitor aware Hyprland workspace widget for use with bars."
url="https://github.com/FieldofClay/hyprland-workspaces"
makedepends=('cargo')
depends=('hyprland')
arch=('x86_64')
license=('MIT')
source=("https://github.com/FieldofClay/hyprland-workspaces/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3a81f6a8974d95a704e3b92d041c6602061bebe21057807ec173326487f4eb6f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
