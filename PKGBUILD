# Maintainer: DIMFLIX <dimflix.official@gmail.com>
pkgname=hotkeyhub-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Cheat Sheet for keybindings in hyprland, bspwm, and other WMs"
arch=('x86_64')
url="https://github.com/meowrch/HotkeyHub"
license=('GPL-3.0-or-later')
depends=('gtk4')
source=(
  "$url/releases/download/v$pkgver/hotkeyhub-linux-x86_64"
  "$url/releases/download/v$pkgver/hotkeyhub.desktop"
  "$url/releases/download/v$pkgver/hotkeyhub.png"
)
sha256sums=('780fb1ad8c92248b6a11840fcf4dd03a07c9c0dd9309c2bc29e80ba234485def' '89c1e4c0ecc72b04bb47fbd4e458a57c8e7b70c946e4fc93112ceb853ddbf5e9' 'b20dd3c9e9b2627e9efb15f099712b4f7a9785903065f8195ab78f78ac2b0409')

package() {
  # Install binary
  install -Dm755 hotkeyhub-linux-x86_64 "$pkgdir/usr/bin/hotkeyhub"

  # Install app info
  install -Dm644 "hotkeyhub.desktop" "$pkgdir/usr/share/applications/hotkeyhub.desktop"
  install -Dm644 "hotkeyhub.png" "$pkgdir/usr/share/pixmaps/hotkeyhub.png"
}
