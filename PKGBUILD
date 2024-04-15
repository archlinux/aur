# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: catniptwinz <chris@peargrowersseries.com>

pkgname="front-panel-designer"
pkgver="6.4.1"
pkgrel="1"
pkgdesc="Free CAD software that lets you design and order custom front panels and enclosures exactly to your specification."
arch=("x86_64")
url="https://www.frontpanelexpress.com/front-panel-designer"
license=("LicenseRef-custom")
depends=(
    "cairo"
    "curl"
    "fontconfig"
    "freetype2"
    "gcc-libs"
    "gdk-pixbuf2"
    "glib2"
    "glibc"
    "gtk2"
    "hicolor-icon-theme"
    "libglvnd"
    "libsm"
    "libx11"
    "libxext"
    "libxi"
    "libxmu"
    "libxxf86vm"
    "pango"
    "zlib"
)
optdepends=(
    "at-spi2-core: for placing orders"
    "libidn2: for placing orders"
    "libnghttp2: for placing orders"
    "libpsl: for placing orders"
    "libxtst: for placing orders"
)
options=("!debug" "!strip")
source=("https://assets.frontpanelexpress.com/fpd/Version-$pkgver/FrontDesign-US-$pkgver-amd64.deb")
sha256sums=("e44e26d6a1fde649ee98a0f6fa21bc53ad06b412c2d7def1eaec243aaabe98a6")

package() {
  tar xf data.tar.xz -C "$pkgdir"

  mv "$pkgdir/usr/local/bin" "$pkgdir/usr/bin"
  rmdir "$pkgdir/usr/local"

  install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/opt/FrontDesign/share/FrontDesign/License"/*
}
