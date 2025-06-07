pkgname=royal-blocks-bin
pkgver=1.1.1
pkgrel=2
pkgdesc="A homemade Royal Tetris in C++"
arch=('x86_64')
url="https://github.com/ulb-info2-group5/Tetris-Blocks"
license=('GPL3')
depends=('qt5-base')  # Qt remains dynamic
makedepends=('cmake' 'gcc' 'make' 'qt5-base')
source=("https://github.com/ulb-info2-group5/Royal-Blocks/releases/download/v1.1.1/royal-blocks-linux-bin.tar.zst")
sha256sums=('8331766727af996aca1b8d30b78d88e6f82bdfafa6825f55dcad4cae129d55b2')
options=(!strip)

package() {
  install -Dm755 "$pkgname-$pkgver/royal-blocks-gui"     "$pkgdir/usr/bin/royal-blocks"
  install -Dm755 "$pkgname-$pkgver/royal-blocks-tui"     "$pkgdir/usr/bin/royal-blocks-tui"
  install -Dm755 "$pkgname-$pkgver/royal-blocks-server"  "$pkgdir/usr/bin/royal-blocks-server"

  install -Dm644 "$pkgname-$pkgver/res/royal-blocks.desktop" "$pkgdir/usr/share/applications/royal-blocks.desktop"
  install -Dm644 "$pkgname-$pkgver/res/royal-blocks-tui.desktop" "$pkgdir/usr/share/applications/royal-blocks-tui.desktop"
  install -Dm644 "$pkgname-$pkgver/res/royal-blocks-server.desktop" "$pkgdir/usr/share/applications/royal-blocks-server.desktop"

  for size in 1024 512 256 128 64 32 16; do
    install -Dm644 "$pkgname-$pkgver/res/logo_${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/royal-blocks.png"
  done
}
