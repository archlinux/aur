# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell
pkgname=('nwg-look-bin')
pkgver=0.2.6
pkgrel=2
pkgdesc="GTK3 settings editor adapted to work w/ wlroots-based compositors (binary package)"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-look"
license=('MIT')
provides=('nwg-look')
conflicts=('nwg-look' 'nwg-look-git')
depends=('gtk3' 'glib2' 'cairo' 'xcur2png')

source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-look/releases/download/v"$pkgver"/nwg-look-v"$pkgver"_x86_64.tar.gz")

md5sums=('f9ad5bb85ceef300c98034b7d3aaa5d2')

package() {
  cd "$srcdir"
  install -Dm 755 -t "${pkgdir}/usr/bin" nwg-look
  install -Dm 644 -t "${pkgdir}/usr/share/${pkgname}" stuff/main.glade
  install -Dm 644 -t "${pkgdir}/usr/share/${pkgname}/langs" langs/*
  install -Dm 644 -t "${pkgdir}/usr/share/applications" stuff/nwg-look.desktop
  install -Dm 644 -t "${pkgdir}/usr/share/pixmaps" stuff/nwg-look.svg
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

}
