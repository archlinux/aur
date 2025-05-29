pkgname=royal-blocks
pkgver=1.1.1
pkgrel=1
options=(!debug strip)
pkgdesc="A homemade Royal Tetris in C++"
arch=('x86_64')
url="https://github.com/ulb-info2-group5/Tetris-Blocks"
license=('GPL3')
depends=('qt5-base')
makedepends=('gcc' 'make' 'cmake' 'qt5-base')
source=("https://github.com/ulb-info2-group5/Royal-Blocks/releases/download/v1.1.1/royal-blocks-1.1.1-x86_64.pkg.tar.zst")
sha256sums=('10421b488df7f508378e28d73ec97a5143c5d9551a44e9c4fc4d96f581042812')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/royal-blocks-gui" "$pkgdir/usr/bin/royal-blocks"
  install -Dm755 "$srcdir/$pkgname-$pkgver/royal-blocks-tui" "$pkgdir/usr/bin/royal-blocks-tui"
  install -Dm755 "$srcdir/$pkgname-$pkgver/royal-blocks-server" "$pkgdir/usr/bin/royal-blocks-server"

  install -Dm644 "$srcdir/$pkgname-$pkgver/res/royal-blocks.desktop" "$pkgdir/usr/share/applications/royal-blocks.desktop"
  install -Dm644 "$srcdir/$pkgname-$pkgver/res/royal-blocks-tui.desktop" "$pkgdir/usr/share/applications/royal-blocks-tui.desktop"
  install -Dm644 "$srcdir/$pkgname-$pkgver/res/royal-blocks-server.desktop" "$pkgdir/usr/share/applications/royal-blocks-server.desktop"

  install -Dm644 "$srcdir/$pkgname-$pkgver/res/logo_1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/royal-blocks.png"
  install -Dm644 "$srcdir/$pkgname-$pkgver/res/logo_512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/royal-blocks.png"
  install -Dm644 "$srcdir/$pkgname-$pkgver/res/logo_256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/royal-blocks.png"
  install -Dm644 "$srcdir/$pkgname-$pkgver/res/logo_128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/royal-blocks.png"
  install -Dm644 "$srcdir/$pkgname-$pkgver/res/logo_64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/royal-blocks.png"
  install -Dm644 "$srcdir/$pkgname-$pkgver/res/logo_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/royal-blocks.png"
  install -Dm644 "$srcdir/$pkgname-$pkgver/res/logo_16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/royal-blocks.png"
}
