# Maintainer: qmltoslint
pkgname=kclock-rs-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A high-performance cross-platform timer application built with Rust and Slint UI"
arch=('x86_64')
url="https://codeberg.org/qml-to-slint/kclock-rs"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'libxkbcommon' 'pango' 'wayland' 'xdg-utils')
provides=('kclock-rs')
conflicts=('kclock-rs')
source=("kclock-rs-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/kclock-rs-x86_64-linux.tar.gz"
  "kclock-rs.desktop"
  "logo.svg"
  "LICENSE.md"
  "basic-alarm-ringtone.mp3")
sha256sums=('b032e257f1ee74e463d157f73ee4a8d62e7b06def719d1ab6e5f7d839e661176'
  'f444a862b990c9f8f12c6e96189f53ec4e822a266ee52ce38ce5fdeb6f247e45'
  'dc74db5ade14026b250ed77ef314c7a9c399524987f60f30648bcb62a72f4ea1'
  '07e538516e7f484ae13c2edba3c11944c437902a27af81c222cffb3fc896967d'
  'e893fe84cd14f0d87cceca519b3801b60f2500bf451132a4e2e0d60213189b3b')

package() {
  cd "$srcdir/kclock-rs-$pkgver"

  install -Dm755 kclock-rs "$pkgdir/usr/bin/kclock-rs"
  install -Dm644 "$srcdir/basic-alarm-ringtone.mp3" "$pkgdir/usr/share/kclock-rs/assets/basic-alarm-ringtone.mp3"
  install -Dm644 "$srcdir/kclock-rs.desktop" "$pkgdir/usr/share/applications/kclock-rs.desktop"
  install -Dm644 "$srcdir/logo.svg" "$pkgdir/usr/share/pixmaps/kclock-rs.svg"
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
