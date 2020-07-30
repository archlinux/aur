# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="front-panel-designer"
pkgver="6.3.1"
pkgrel="1"
pkgdesc="Free CAD software that lets you design and order custom front panels and enclosures exactly to your specification."
arch=("x86_64")
url="http://www.frontpanelexpress.com/front_panel_designer/the_idea/"
license=("custom")
# depends=("libpng12")
source=("https://assets.frontpanelexpress.com/fpd/Version-$pkgver/FrontDesign-US-$pkgver-amd64.deb")
options=("!strip")
sha256sums=("e3653370e0f0d3cd96a200eadad813be3500fdeaa2475fc80f13fb436e856786")

package() {
  tar xf data.tar.xz -C "$pkgdir"

  mv "$pkgdir/usr/local/bin" "$pkgdir/usr/bin"
  rmdir "$pkgdir/usr/local"

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s /opt/FrontDesign/share/FrontDesign/License "$pkgdir/usr/share/licenses/$pkgname"
}
