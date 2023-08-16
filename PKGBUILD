# Maintainer: Jonathan Bangert <jonathan@bangert.dk>
pkgname='music-assistant-desktop-bin'
pkgver=0.0.14
pkgrel=1
pkgdesc="Music Assistant Desktop app"
arch=('x86_64')
url="https://github.com/music-assistant/music-assistant-desktop"
conflicts=(music-assistant-desktop)
provides=(music-assistant-desktop)
dependencies=(curl)
license=('Apache-2.0')
md5sums=('03d5e8ca922daff8a6bee5597da59bbb')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/music-assistant-desktop-${pkgver}")

package() {
  cd "$srcdir/"

  curl -L -o music-assistant-desktop.desktop https://raw.githubusercontent.com/music-assistant/music-assistant-desktop/v$pkgver/musicassistant.desktop
  curl -L -o music-assistant-desktop.png https://raw.githubusercontent.com/music-assistant/music-assistant-desktop/v$pkgver/src-tauri/icons/128x128.png

	install -DCm644 ./music-assistant-desktop.desktop "$pkgdir/usr/share/applications/music-assistant-desktop.desktop"
  install -DCm644 ./music-assistant-desktop.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/music-assistant-desktop.png"
  install -DCm0755 ./$pkgname-$pkgver "$pkgdir/usr/bin/music-assistant-desktop"
}
