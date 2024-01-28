# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell
pkgname=('nwg-menu-bin')
pkgver=0.1.2
pkgrel=1
pkgdesc="MenuStart for sway and other wlroots-based compositors"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-menu"
license=('MIT')
provides=('nwg-menu')
conflicts=('nwg-menu-git' 'nwg-menu')
depends=('gtk3' 'gtk-layer-shell' 'xdg-utils')
optdepends=('foot: to open .desktop files with Terminal=true'
            'thunar: to open files and directories')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-menu/releases/download/v"$pkgver"/nwg-menu-v"$pkgver"_x86_64.tar.gz")

md5sums=('7ee9f8f70222e87150ca089a87735188')

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/nwg-menu/desktop-directories
  install -Dm644 -t "$pkgdir"/usr/share/nwg-menu/desktop-directories/ desktop-directories/*
  install -Dm644 -t "$pkgdir"/usr/share/nwg-menu/ menu-start.css
  install -Dm755 -t "$pkgdir"/usr/bin bin/nwg-menu
  
  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
  install -D -t "$pkgdir"/usr/share/doc/"$pkgname" README.md
}
