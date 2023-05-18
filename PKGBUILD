# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: catniptwinz <chris@peargrowersseries.com>

pkgname="front-panel-designer"
pkgver="6.3.6"
pkgrel="1"
pkgdesc="Free CAD software that lets you design and order custom front panels and enclosures exactly to your specification."
arch=("x86_64")
url="http://www.frontpanelexpress.com/front_panel_designer/the_idea/"
license=("custom")
depends=("glu" "gtk2")
source=("https://assets.frontpanelexpress.com/fpd/Version-$pkgver/FrontDesign-US-$pkgver-amd64.deb")
options=("!strip")
sha256sums=("1473d5072f4217348e932fa0e216b40432072e3b97b5c9b995597058a31ed612")

package() {
  tar xf data.tar.xz -C "$pkgdir"

  mv "$pkgdir/usr/local/bin" "$pkgdir/usr/bin"
  rmdir "$pkgdir/usr/local"

  install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/opt/FrontDesign/share/FrontDesign/License"/*
}
