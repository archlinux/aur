# Maintainer: Amenatsu <rainsummertse@outlook.com>
pkgbase=mgp-vn-tool-deb
pkgname=mgp-vn-tool-deb
provides=('mgp-vn-tool')
pkgver=0.2.0
pkgrel=0
source=("https://github.com/BearBin1215/mgp-vn-tool/releases/download/v${pkgver}/mgp-vn-tool_${pkgver}_amd64.deb")
pkgdesc="A tool for visual novels association of MoegirlPedia"
arch=('x86_64')
license=('MIT')
url="https://github.com/BearBin1215/mgp-vn-tool"
depends=('webkit2gtk-4.1' 'gtk3')
sha256sums=('9461ccc732e1aac3b55800bdea85e5c264e3ea9563ec2fe7ae6a7202966f0e60')
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
