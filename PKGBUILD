pkgname=raku-music-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Raku Music – Flutter-based Linux-first music player for your local library"
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
  '25034484037c3614d842930ac0e5b0a525237c7c450b4529e5202c699312b18a'
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
