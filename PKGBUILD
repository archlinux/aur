pkgname=raku-music-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="Raku Music – Flutter-based Linux music player"
arch=('x86_64')
url="https://github.com/sauraku/Raku-Music"
license=('GPL3')
depends=(
  'gtk3'
  'alsa-lib'
  'glibc'
  'libayatana-appindicator'
  'ffmpeg'
)
provides=('raku-music')
conflicts=('raku-music')

source=(
  "https://github.com/sauraku/Raku-Music/releases/download/v${pkgver}/raku-music-v${pkgver}.tar.gz"
  "raku-music.desktop"
  "icon.png"
)
sha256sums=(
  '2506e28526638bccef4f7f2da978a7ec98ff1888f0c412426fb985f3a4c9c17a'
  'SKIP'
  'SKIP'
)

package() {
  install -d "$pkgdir/opt/raku-music"
  cp -r * "$pkgdir/opt/raku-music"

  # launcher
  install -d "$pkgdir/usr/bin"
  ln -s /opt/raku-music/raku_music "$pkgdir/usr/bin/raku-music"

install -Dm644 "$srcdir/raku-music.desktop" \
  "$pkgdir/usr/share/applications/raku-music.desktop"

install -Dm644 "$srcdir/icon.png" \
  "$pkgdir/usr/share/icons/hicolor/256x256/apps/raku-music.png"
}
