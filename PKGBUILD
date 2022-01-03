# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: catniptwinz <chris@peargrowersseries.com>

pkgname="front-panel-designer"
pkgver="6.3.5"
pkgrel="1"
pkgdesc="Free CAD software that lets you design and order custom front panels and enclosures exactly to your specification."
arch=("x86_64")
url="http://www.frontpanelexpress.com/front_panel_designer/the_idea/"
license=("custom")
depends=("glu" "gtk2")
source=("https://assets.frontpanelexpress.com/fpd/Version-$pkgver/FrontDesign-US-$pkgver-amd64.deb")
options=("!strip")
sha256sums=("e03656419b5647e9aaa7088b8b1556ab6f43f9223199770f37fbd0a5730ea4af")

package() {
  tar xf data.tar.xz -C "$pkgdir"

  mv "$pkgdir/usr/local/bin" "$pkgdir/usr/bin"
  rmdir "$pkgdir/usr/local"

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s /opt/FrontDesign/share/FrontDesign/License "$pkgdir/usr/share/licenses/$pkgname"
}
