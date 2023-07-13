# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell
pkgname=('nwg-look-bin')
pkgver=0.2.3
pkgrel=1
pkgdesc="GTK3 settings editor adapted to work w/ wlroots-based compositors (binary package)"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-look"
license=('MIT')
provides=('nwg-look')
conflicts=('nwg-look' 'nwg-look-git')
depends=('gtk3' 'glib2' 'cairo' 'xcur2png')

source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-look/releases/download/v"$pkgver"/nwg-look-v"$pkgver"_x86_64.tar.gz")

md5sums=('18fa57775baf891c421a1cf7fa5aa489')

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/nwg-look
  install -Dm644 -t "$pkgdir"/usr/share/nwg-look stuff/main.glade
  install -Dm644 -t "$pkgdir"/usr/share/nwg-look/langs langs/*
  install -Dm644 -t "$pkgdir"/usr/share/applications stuff/nwg-look.desktop
  install -Dm644 -t "$pkgdir"/usr/share/pixmaps stuff/nwg-look.svg
  install -Dm755 -t "$pkgdir"/usr/bin nwg-look
}
