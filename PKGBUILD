# Maintainer: Amenatsu <rainsummertse@outlook.com>
pkgbase=mgp-vn-tool-deb
pkgname=mgp-vn-tool-deb
provides=('mgp-vn-tool')
pkgver=0.1.0
pkgrel=0
source=("https://github.com/BearBin1215/mgp-vn-tool/releases/download/v0.1.0/mgp-vn-tool_${pkgver}_amd64.deb")
pkgdesc="A tool for visual novels association of MoegirlPedia"
arch=('x86_64')
license=('MIT')
url="https://github.com/BearBin1215/mgp-vn-tool"
depends=('webkit2gtk-4.1' 'gtk3')
sha256sums=('ea034694ab3149dd7d2b90f2920adbff1a9c2a75ff9d342bab2d3ab36800d30e')
prepare() {
  cd "$srcdir"
  bsdtar -xf "mgp-vn-tool_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.gz
}
package() {
  cd "$srcdir"
  install -Dm755 "$srcdir/usr/bin/mgp-vn-tool" "$pkgdir/usr/bin/mgp-vn-tool"
  install -Dm644 "$srcdir/usr/share/applications/mgp-vn-tool.desktop" "$pkgdir/usr/share/applications/mgp-vn-tool.desktop"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/32x32/apps/mgp-vn-tool.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/mgp-vn-tool.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/128x128/apps/mgp-vn-tool.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/mgp-vn-tool.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256@2/apps/mgp-vn-tool.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/mgp-vn-tool.png"
}