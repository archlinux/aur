# Maintainer: LIghtJUNction
pkgname=zcall-gui-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Native Project Z control panel for the zcalld local AI gateway (binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcall-gui'
license=('MIT')
optdepends=('xorg-xwayland: run on Wayland sessions' 'noto-fonts-cjk: Chinese and Japanese glyphs')
depends=('zcalld>=0.2.0' 'glibc' 'libgcc' 'libx11' 'libgl' 'freetype2' 'fontconfig' 'curl' 'hicolor-icon-theme')
provides=("zcall-gui=$pkgver")
conflicts=('zcall-gui')
options=('!strip')
source_x86_64=("zcall-gui-v$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/zcall-gui-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("zcall-gui-v$pkgver-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/zcall-gui-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a1eca76ba78a9bddf37ac05a010b3dc4902352fd8d741c092b0dbae526a329ec')
sha256sums_aarch64=('2ef6ba6cff00207341b0846b6d673271cb1327ef9d4f798f826a9fff8bfbf386')

package() {
  cd "$srcdir/zcall-gui-v$pkgver-$CARCH-unknown-linux-gnu"
  PREFIX=/usr DESTDIR="$pkgdir" sh install.sh
  mv "$pkgdir/usr/share/licenses/zcall-gui" "$pkgdir/usr/share/licenses/$pkgname"
}
