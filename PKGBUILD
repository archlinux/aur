# Maintainer: XSilverTH <XSilverTH@proton.me>

pkgname=silverscreen-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Native GTK4 YouTube client that plays videos with MPV (precompiled binary)'
arch=('x86_64')
url='https://github.com/XSilverTH/SilverScreen'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'libsoup3' 'mpv' 'yt-dlp' 'hicolor-icon-theme')
provides=('silverscreen')
conflicts=('silverscreen')
source=("$pkgname-$pkgver.tar.zst::$url/releases/download/v$pkgver/silverscreen-v$pkgver-x86_64.tar.zst")
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  install -Dm755 SilverScreen "$pkgdir/usr/bin/SilverScreen"
  ln -s SilverScreen "$pkgdir/usr/bin/silverscreen"
  install -Dm644 io.github.silverscreen.SilverScreen.desktop \
    "$pkgdir/usr/share/applications/io.github.silverscreen.SilverScreen.desktop"
  install -Dm644 io.github.silverscreen.SilverScreen.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.silverscreen.SilverScreen.metainfo.xml"
  install -Dm644 io.github.silverscreen.SilverScreen.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.silverscreen.SilverScreen.svg"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  if [ -f DiscordRPC.LICENSE ]; then
    install -Dm644 DiscordRPC.LICENSE \
      "$pkgdir/usr/share/licenses/$pkgname/DiscordRPC.LICENSE"
  fi
  if [ -f YoutubeAPI.LICENSE ]; then
    install -Dm644 YoutubeAPI.LICENSE \
      "$pkgdir/usr/share/licenses/$pkgname/YoutubeAPI.LICENSE"
  fi
}
