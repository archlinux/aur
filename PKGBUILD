pkgname=royal-blocks-git
pkgver=1.1.1.3.ga31c6eb
pkgrel=1
pkgdesc="A homemade Royal Tetris in C++"
arch=('x86_64')
url="https://github.com/ulb-info2-group5/Tetris-Blocks"
license=('GPL3')
depends=('qt5-base')
makedepends=('gcc' 'make' 'cmake' 'qt5-base')
source=("git+https://github.com/ulb-info2-group5/Royal-Blocks.git")
md5sums=('SKIP')
provides=('royal-blocks')
conflicts=('royal-blocks')

pkgver() {
  cd Royal-Blocks
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/Royal-Blocks"
  make
}

package() {
  cd "$srcdir/Royal-Blocks"

  install -Dm755 "royal-blocks-gui" "$pkgdir/usr/bin/royal-blocks"
  install -Dm755 "royal-blocks-tui" "$pkgdir/usr/bin/royal-blocks-tui"
  install -Dm755 "royal-blocks-server" "$pkgdir/usr/bin/royal-blocks-server"

  install -Dm644 "res/royal-blocks.desktop" "$pkgdir/usr/share/applications/royal-blocks.desktop"
  install -Dm644 "res/royal-blocks-tui.desktop" "$pkgdir/usr/share/applications/royal-blocks-tui.desktop"
  install -Dm644 "res/royal-blocks-server.desktop" "$pkgdir/usr/share/applications/royal-blocks-server.desktop"

  install -Dm644 "res/logo_1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/royal-blocks.png"
  install -Dm644 "res/logo_512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/royal-blocks.png"
  install -Dm644 "res/logo_256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/royal-blocks.png"
  install -Dm644 "res/logo_128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/royal-blocks.png"
  install -Dm644 "res/logo_64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/royal-blocks.png"
  install -Dm644 "res/logo_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/royal-blocks.png"
  install -Dm644 "res/logo_16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/royal-blocks.png"
}
