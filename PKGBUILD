pkgname=royal-blocks-bin
pkgver=1.1.2
pkgrel=2
pkgdesc="A homemade Royal Tetris in C++"
arch=('x86_64')
url="https://github.com/ulb-info2-group5/Royal-Blocks"
license=('GPL3')
depends=('qt5-base')  # Qt remains dynamic
makedepends=('cmake' 'gcc' 'make' 'qt5-base')
source=("https://github.com/ulb-info2-group5/Royal-Blocks/releases/download/v1.1.2/royal-blocks-linux-bin.tar.zst")
sha256sums=('187589e0ceb2bc3254edb99aa2b1df16bbe4a63558d2d6c727551f0142576d3d')
options=(!strip)

package() {
  install -Dm755 "royal-blocks-gui"     "$pkgdir/usr/bin/royal-blocks"
  install -Dm755 "royal-blocks-tui"     "$pkgdir/usr/bin/royal-blocks-tui"
  install -Dm755 "royal-blocks-server"  "$pkgdir/usr/bin/royal-blocks-server"

  install -Dm644 "res/royal-blocks.desktop" "$pkgdir/usr/share/applications/royal-blocks.desktop"
  install -Dm644 "res/royal-blocks-tui.desktop" "$pkgdir/usr/share/applications/royal-blocks-tui.desktop"
  install -Dm644 "res/royal-blocks-server.desktop" "$pkgdir/usr/share/applications/royal-blocks-server.desktop"

  for size in 1024 512 256 128 64 32 16; do
    install -Dm644 "res/logo_${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/royal-blocks.png"
  done
}
