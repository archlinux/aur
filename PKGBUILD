# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell
pkgname=('nwg-drawer-bin')
pkgver=0.4.1
pkgrel=1
pkgdesc="Application drawer for sway and other wlroots-based compositors"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-drawer"
license=('MIT')
provides=('nwg-drawer')
conflicts=('nwg-drawer-git' 'nwg-drawer')
depends=('gtk3' 'gtk-layer-shell' 'xdg-utils')
optdepends=('foot: to open .desktop files with Terminal=true'
            'thunar: to open files and directories')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-drawer/releases/download/v"$pkgver"/nwg-drawer-v"$pkgver"_x86_64.tar.gz")

md5sums=('56b8595471241b20a7c50276681b223d')

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/nwg-drawer/desktop-directories
  install -Dm644 -t "$pkgdir"/usr/share/nwg-drawer/desktop-directories/ desktop-directories/*
  install -Dm644 -t "$pkgdir"/usr/share/nwg-drawer/ drawer.css
  install -Dm755 -t "$pkgdir"/usr/bin bin/nwg-drawer
}
