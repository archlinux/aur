# Maintainer: LIghtJUNction
pkgname=zcall-gui-bin
pkgver=0.1.4
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
sha256sums_x86_64=('103e27a0e7398abb0dce39b6f69638b263be4ecb5ceb0ea8a04ed358157ae7ed')
sha256sums_aarch64=('e98c55aad815eb60a0f86f9e57a36e9c2474f1399776622ca06ba70898cdaed7')

package() {
  cd "$srcdir/zcall-gui-v$pkgver-$CARCH-unknown-linux-gnu"
  PREFIX=/usr DESTDIR="$pkgdir" sh install.sh
  mv "$pkgdir/usr/share/licenses/zcall-gui" "$pkgdir/usr/share/licenses/$pkgname"
}
