# Maintainer: guohw <go1em>
pkgname=shotori-clipboard-uri-list
pkgver=0.19.1
pkgrel=2
pkgdesc="Screenshot tool fork: the clipboard also offers text/uri-list and text/html so X11 clients can paste large images"
arch=('x86_64')
url="https://github.com/go1em/shotori"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'libxau' 'libxdmcp' 'libxkbcommon')
provides=('shotori')
conflicts=('shotori' 'shotori-git' 'shotori-bin')
source=("$url/releases/download/v0.19.1-clipboard2/shotori-__TAG__-x86_64.tar.gz")
sha256sums=('79d9c953fdd0c5028917a2ecf7e241e5cc08485a3c706c3890a8ddd60e1d0f68')

package() {
  install -Dm755 shotori "$pkgdir/usr/bin/shotori"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 assets/shotori.desktop "$pkgdir/usr/share/applications/shotori.desktop"
  for icon in assets/app/shotori-*.png; do
    size=$(basename "$icon" .png); size=${size#shotori-}
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/shotori.png"
  done
  install -Dm644 assets/app/shotori.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/shotori.svg"
}
