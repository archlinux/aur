# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=borna-fonts
pkgver=1.0
pkgrel=1
pkgdesc="Borna Rayaneh Co. Persian B font series."
url="http://www.bornaray.com/products/font.html"
arch=(any)
license=(unknown)
depends=('fontconfig')
provides=('ttf-borna' "$pkgname")
conflicts=('ttf-borna' "$pkgname")
replaces=('ttf-borna')
source=("$pkgname-$pkgver.zip::http://www.bornaray.com/downloads/bfonts.zip")
sha256sums=('f9d7dcabe3378b82d7d32ae5b4f41b90dc9f72a572604ee59b4ebde54851379a')

prepare() {
  cd BFonts
  for i in $(find . -type f -name "*[A-Z]*"); 
  do mv "$i" "$(echo $i | tr A-Z a-z)"; 
  done
}

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 BFonts/*.ttf
}

# vim:set ts=2 sw=2 et:
