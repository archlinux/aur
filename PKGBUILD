# Maintainer: Jonathan Bangert <jonathan@bangert.dk>
pkgname='music-assistant-desktop-bin'
pkgver=0.0.31
pkgrel=1
pkgdesc="Music Assistant Companion App"
arch=('x86_64')
url="https://github.com/music-assistant/music-assistant-desktop"
conflicts=(music-assistant-desktop)
provides=(music-assistant-companion)
license=('Apache-2.0')
md5sums=('4309dc5363be649ea1ba99cafebdc4fd'
         '4d6cfc74a2b2d09a0f28c259d2a39eb7'
         'c1c710f0f2736214866afd8bb14aafd5'
         '4a4c0574f4dd2f9492823778d53754aa')
source=("squeezelite::$url/releases/download/v$pkgver/squeezelite-x86_64-unknown-linux-gnu" "music-assistant-companion.png::https://raw.githubusercontent.com/music-assistant/music-assistant-desktop/v$pkgver/src-tauri/icons/128x128.png" "music-assistant-companion.desktop::https://raw.githubusercontent.com/music-assistant/music-assistant-desktop/v$pkgver/musicassistant.desktop" "$pkgname-$pkgver::$url/releases/download/v$pkgver/music-assistant-companion-${pkgver}")

package() {
  cd "$srcdir/"

  install -DCm644 ./music-assistant-companion.desktop "$pkgdir/usr/share/applications/music-assistant-companion.desktop"
  install -DCm644 ./music-assistant-companion.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/music-assistant-companion.png"
  install -DCm0755 ./$pkgname-$pkgver "$pkgdir/usr/bin/music-assistant-companion"
  install -DCm0755 ./squeezelite "$pkgdir/usr/bin/squeezelite"
}
