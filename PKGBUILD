# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell
pkgname=('nwg-dock-bin')
pkgver=0.3.9
pkgrel=1
pkgdesc="GTK3-based dock for sway Wayland compositor"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-dock"
license=('MIT')
provides=('nwg-dock')
conflicts=('nwg-dock-git' 'nwg-dock')
depends=('gtk3' 'gtk-layer-shell')
optdepends=('nwg-drawer: default application launcher')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-dock/releases/download/v"$pkgver"/nwg-dock-v"$pkgver"_x86_64.tar.gz")

md5sums=('9fea3e0bcfa967f5c9392ae93d8cdcc2')

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/nwg-dock/images
  install -Dm644 -t "$pkgdir"/usr/share/nwg-dock/images/ images/*
  install -Dm644 -t "$pkgdir"/usr/share/nwg-dock/ config/*
  install -Dm755 -t "$pkgdir"/usr/bin bin/nwg-dock
}
