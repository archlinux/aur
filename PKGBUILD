# Maintainer: qmltoslint
pkgname=kclock-rs-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A high-performance cross-platform timer application built with Rust and Slint UI"
arch=('x86_64')
url="https://codeberg.org/qml-to-slint/kclock-rs"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'libxkbcommon' 'pango' 'wayland' 'xdg-utils')
provides=('kclock-rs')
conflicts=('kclock-rs')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/kclock-rs-x86_64-linux.tar.gz"
  "kclock-rs.desktop"
  "logo.svg"
  "LICENSE.md")
sha256sums=('e00d6819eabb2267dcd82c5fad8488cfa44b96c615cb57fe5d283227de5920af'
  'f444a862b990c9f8f12c6e96189f53ec4e822a266ee52ce38ce5fdeb6f247e45'
  'dc74db5ade14026b250ed77ef314c7a9c399524987f60f30648bcb62a72f4ea1'
  '07e538516e7f484ae13c2edba3c11944c437902a27af81c222cffb3fc896967d')

package() {
  cd "$srcdir"

  # Install binary
  install -Dm755 kclock-rs "$pkgdir/usr/bin/kclock-rs"

  # Install desktop file
  install -Dm644 kclock-rs.desktop "$pkgdir/usr/share/applications/kclock-rs.desktop"

  # Install icon
  install -Dm644 logo.svg "$pkgdir/usr/share/pixmaps/kclock-rs.svg"

  # Install license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
