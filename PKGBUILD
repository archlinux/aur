# Maintainer: LIghtJUNction
pkgname=zcall-gui-bin
pkgver=0.1.0
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
sha256sums_x86_64=('f8239366812bbce656abb4ad622c2ffa8001d95e8d62ad9ca10bbf91212ae5a5')
sha256sums_aarch64=('fa34e86214f8fd0b64bd0aa2b4d6dd95014bbf73c6486e752c8c0921a10d04d4')

package() {
  cd "$srcdir/zcall-gui-v$pkgver-$CARCH-unknown-linux-gnu"
  PREFIX=/usr DESTDIR="$pkgdir" sh install.sh
  mv "$pkgdir/usr/share/licenses/zcall-gui" "$pkgdir/usr/share/licenses/$pkgname"
}
