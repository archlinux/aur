# Maintainer: <TheCyberArcher@protonmail.ch>

pkgname='music-assistant-desktop-bin'
pkgver=0.0.88
pkgrel=1
pkgdesc="Music Assistant Companion App"
arch=('x86_64')
url="https://github.com/music-assistant/companion/"
conflicts=(music-assistant-desktop)
depends=('libappindicator-gtk3')
provides=(music-assistant-companion)
license=('Apache-2.0')
sha256sums=('4cce2f26f734bd814550ae632b8784299146f4182c3e773a2a0a4d33ae8668f8'
         '7d92e65da6fc3aadb7115904d805216615ac41980558162751cc0c6781451f8a'
         '57473f7260ab129975f130cd9827fa77aacb819d76f99de3f76e162963c9f0c2'
         '516304e91002e816b0016c7ef3010fd2bab05cf37d619bcab964636d2f2b758b')
source=("squeezelite::$url/releases/download/v$pkgver/squeezelite-x86_64-unknown-linux-gnu" "music-assistant-companion.png::https://raw.githubusercontent.com/music-assistant/music-assistant-desktop/v$pkgver/src-tauri/icons/128x128.png" "music-assistant-companion.desktop::https://raw.githubusercontent.com/music-assistant/music-assistant-desktop/v$pkgver/musicassistant.desktop" "$pkgname-$pkgver::$url/releases/download/v$pkgver/music-assistant-companion-${pkgver}")

package() {
  cd "$srcdir/"

  install -DCm644 ./music-assistant-companion.desktop "$pkgdir/usr/share/applications/music-assistant-companion.desktop"
  install -DCm644 ./music-assistant-companion.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/music-assistant-companion.png"
  install -DCm0755 ./$pkgname-$pkgver "$pkgdir/usr/bin/music-assistant-companion"
  install -DCm0755 ./squeezelite "$pkgdir/usr/bin/squeezelite"
}