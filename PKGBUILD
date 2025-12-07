# Maintainer: Bono Fox <tiny4linux@bono-fox.de>

pkgname=tiny4linux-gui-v1
pkgver=1.4.3
pkgrel=1
pkgdesc="A graphical interface for controlling the OBSBOT Tiny series."
arch=('x86_64')
url="https://github.com/OpenFoxes/Tiny4Linux"
license=('EUPL')
categories=('Utility')
depends=()
makedepends=('rust' 'cargo')
source=("$url/releases/download/v$pkgver/tiny4linux-$pkgver.tar.gz")
sha256sums=('5c42dae0279b7f50de22f2663d41c7e6e272186e2401be08493d9eafb7331340')

build() {
  cargo build --release --locked
}

package() {
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm755 "src/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/tiny4linux.png"
  install -Dm755 "src/gui/tiny4linux.desktop" "$pkgdir/usr/share/applications/tiny4linux.desktop"
}