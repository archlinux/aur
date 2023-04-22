# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell
pkgname=('nwg-dock-hyprland-bin')
pkgver=0.0.1
pkgrel=1
pkgdesc="GTK3-based dock for Hyprland Wayland compositor"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-dock-hyprland"
license=('MIT')
provides=('nwg-dock-hyprland')
conflicts=('nwg-dock-hyprland-git' 'nwg-dock-hyprland')
depends=('gtk3' 'gtk-layer-shell')
optdepends=('nwg-drawer: default application launcher')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-dock-hyprland/releases/download/v"$pkgver"/nwg-dock-hyprland-v"$pkgver"_x86_64.tar.gz")

md5sums=('492fe4a7aceaa4f4b34ab79b489fc274')

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/nwg-dock/images
  install -Dm644 -t "$pkgdir"/usr/share/nwg-dock-hyprland/images/ images/*
  install -Dm644 -t "$pkgdir"/usr/share/nwg-dock-hyprland/ config/*
  install -Dm755 -t "$pkgdir"/usr/bin bin/nwg-dock-hyprland
}
