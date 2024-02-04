# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell
pkgname=('nwg-bar-bin')
pkgver=0.1.6
pkgrel=2
pkgdesc="GTK3-based button bar for sway and other wlroots-based compositors"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-bar"
license=('MIT')
provides=('nwg-bar')
conflicts=('nwg-bar-git' 'nwg-bar')
depends=('gtk3' 'gtk-layer-shell')

source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-bar/releases/download/v"$pkgver"/nwg-bar-v"$pkgver"_x86_64.tar.gz")

md5sums=('76319b9c90d5f36533f23b2f6f1b32e8')

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/nwg-bar/images
  install -Dm644 -t "$pkgdir"/usr/share/nwg-bar/images/ images/*
  install -Dm644 -t "$pkgdir"/usr/share/nwg-bar/ config/*
  install -Dm755 -t "$pkgdir"/usr/bin bin/nwg-bar
  install -D -t "$pkgdir"/usr/share/licenses/nwg-bar LICENSE
  install -D -t "$pkgdir"/usr/share/doc/nwg-bar README.md
}
