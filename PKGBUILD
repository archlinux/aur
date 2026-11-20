# Maintainer: LIghtJUNction
pkgname=zcall-gui-bin
pkgver=0.1.2
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
sha256sums_x86_64=('126c7c3e5de38cdae32cd1058a38fe43852939ac702714d95bf40833140f6c29')
sha256sums_aarch64=('7cfc93a57201dc82e2e808c082a8b3f224f060c7d4ee56c0193bef23be2b5c4c')

package() {
  cd "$srcdir/zcall-gui-v$pkgver-$CARCH-unknown-linux-gnu"
  PREFIX=/usr DESTDIR="$pkgdir" sh install.sh
  mv "$pkgdir/usr/share/licenses/zcall-gui" "$pkgdir/usr/share/licenses/$pkgname"
}
