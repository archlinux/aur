# Maintainer: SnailDOS <snaildos@snaildos.com>

pkgname=fifo-bin
_pkgname=${pkgname%}
pkgver=1.2.1
pkgrel=1
pkgdesc="The future of browsing. Seamless experience for the EncryptOS experience, made with love by the same developers you all know, SnailDOS."
arch=(x86_64)
url="https://fifo.snaildos.com"
license=("GNU" "v3")
depends=(
  zlib
  libgl
  fuse2
)
provides=(fifo)
conflicts=(fifo)
options=(!strip)
source=(
  "Fifo-$pkgver.AppImage::https://github.com/SnailDOS/Fifo-Browser/releases/download/v$pkgver/Fifo-$pkgver.AppImage"
  "https://raw.githubusercontent.com/snaildos/Fifo-Browser/main/static/icons/icon.png"
  "https://raw.githubusercontent.com/snaildos/Fifo-Browser/main/LICENSE"
  "https://raw.githubusercontent.com/snaildos/Fifo-Browser/main/static/fifo.desktop"
)
noextract=("Fifo.AppImage")
sha256sums=('22d2553e49169f5fd5c4cc864f02ccac34c2732d41016ea68ed11ba530a6f761'
            '2230e5025d9fa4417c69b359bb8478d70f08450aef556227df7579779fa6ef08'
            '0bfebc9c7852e4cf48713cbc445971e7925122f2a202b60639ce36ca9dd3b932'
            '1a761bd47099164aca5fceb945a5f335ee78be485aa42baa5761021447992cba')

package() {
  cd "$srcdir"

  # Install binaries
  install -Dm755 "Fifo-$pkgver.AppImage" "$pkgdir/opt/fifo/fifo.AppImage"
  # install -Dm755 -t "$pkgdir/usr/bin" Fifo.AppImage

  # Install pixmap, desktop and license file
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/fifo.png"
  install -Dm644 -t "$pkgdir/usr/share/applications" fifo.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
