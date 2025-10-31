# Maintainer: Bono Fox <tiny4linux@bono-fox.de>

pkgname=tiny4linux-gui
pkgver=2.1.0
pkgrel=1
pkgdesc="A graphical interface for controlling the OBSBOT Tiny series."
arch=('x86_64')
url="https://github.com/OpenFoxes/Tiny4Linux"
license=('EUPL')
categories=('Utility')
depends=()
makedepends=('rust' 'cargo')
source=("$url/releases/download/v$pkgver/tiny4linux-$pkgver.tar.gz")
sha256sums=('35339c7d60dedb8dfa933da2266099f78e4874619aa1fe69f9943d6096205550')

build() {
  cargo build --release --features gui --locked
}

package() {
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm755 "target/release/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/tiny4linux.png"
  install -Dm755 "target/release/assets/icon-widget.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/tiny4linux-widget.png"
  install -Dm755 "src/gui/tiny4linux-dashboard.desktop" "$pkgdir/usr/share/applications/tiny4linux-dashboard.desktop"
  install -Dm755 "src/gui/tiny4linux-widget.desktop" "$pkgdir/usr/share/applications/tiny4linux-widget.desktop"
}