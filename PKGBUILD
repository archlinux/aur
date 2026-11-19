# Maintainer: Coobyk <mail@coobyk.com>
pkgname=oblyx-gui-bin
pkgver=0.1.0.r72
pkgrel=1
pkgdesc="Convert GoodNotes notebooks to SVG, PDF, PNG, and Notability .ntb (GUI, prebuilt binary)"
arch=('x86_64')
url="https://github.com/Coobyk/oblyx"
license=('MIT')
depends=('fontconfig' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'libx11' 'wayland' 'vulkan-icd-loader')
optdepends=('poppler: rasterize PDF page backgrounds for SVG/PNG output'
            'oblyx-bin: command-line converter')
provides=('oblyx-gui')
conflicts=('oblyx-gui')
source=("oblyx-linux-x64-$pkgver.tar.gz::https://github.com/Coobyk/oblyx/releases/download/v$pkgver/oblyx-$pkgver-linux-x64.tar.gz"
        "oblyx-gui.desktop::https://raw.githubusercontent.com/Coobyk/oblyx/v$pkgver/assets/oblyx-gui.desktop"
        "oblyx.svg::https://raw.githubusercontent.com/Coobyk/oblyx/v$pkgver/assets/oblyx.svg")
sha256sums=('fe137486af09c81037267b2c859cf73230c072349f7558c2ee531086f6a22e17' '30f23f6b9a8bafd261bd9d2f7ae3bcffff0615982ff1a1c7021cc37b568c0fbd' '606ddf346df5758cccb52c746850088947ad4dd07701988331134a0aeb734ea1')

package() {
  install -Dm755 "oblyx-$pkgver-linux-x64/oblyx-gui" "$pkgdir/usr/bin/oblyx-gui"
  install -Dm644 "oblyx-$pkgver-linux-x64/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "oblyx-gui.desktop" \
      "$pkgdir/usr/share/applications/oblyx-gui.desktop"
  install -Dm644 "oblyx.svg" \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/oblyx.svg"
}
