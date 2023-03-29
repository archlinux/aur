# Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

pkgname=hyprland-workspaces
pkgver=1.1.0
pkgrel=1
pkgdesc="A multi-monitor aware Hyprland workspace widget for use with bars."
url="https://github.com/FieldofClay/hyprland-workspaces"
makedepends=('cargo')
depends=('hyprland')
arch=('x86_64')
license=('MIT')
source=("https://github.com/FieldofClay/hyprland-workspaces/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3bab2311261fd2e68fe3a3059a3529537eeaa19e083c0ef2de5c3ed173b009f6')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
