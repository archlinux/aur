# Maintainer: Coobyk <mail@coobyk.com>
pkgname=oblyx-gui-bin
pkgver=0.1.0.r70
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
source=("oblyx-linux-x64-$pkgver.tar.gz::https://github.com/Coobyk/oblyx/releases/download/v$pkgver/oblyx-$pkgver-linux-x64.tar.gz")
sha256sums=('626df254ed52a88f11940bf2e87b324d02edbc21d7cb912ef39152287e141b42')

package() {
  cd "oblyx-$pkgver-linux-x64"
  install -Dm755 oblyx-gui "$pkgdir/usr/bin/oblyx-gui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
