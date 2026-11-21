# Maintainer: LIghtJUNction
pkgname=zcall-gui-bin
pkgver=0.1.6
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
sha256sums_x86_64=('38c1275cce2c43d90e9a533168595a0b0fa60e96811fb01f460738a9c7ed0886')
sha256sums_aarch64=('b45d76492cb7474e2e38e400e8ed39f82f740eb15d4e11873d91135fcea3fdb8')

package() {
  cd "$srcdir/zcall-gui-v$pkgver-$CARCH-unknown-linux-gnu"
  PREFIX=/usr DESTDIR="$pkgdir" sh install.sh
  mv "$pkgdir/usr/share/licenses/zcall-gui" "$pkgdir/usr/share/licenses/$pkgname"
}
