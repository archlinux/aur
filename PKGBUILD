# Maintainer: Marcus Ziade <guitaripod@gmail.com>
pkgname=flaccy-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Lossless music player with gapless playback and Last.fm scrobbling (GTK4/libadwaita)"
arch=('x86_64')
url="https://github.com/guitaripod/flaccy"
license=('custom')
depends=('gtk4' 'libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good')
provides=('flaccy')
conflicts=('flaccy')
options=('!strip' '!debug')
source=("https://github.com/guitaripod/flaccy/releases/download/linux-v${pkgver}/flaccy-linux-x86_64.tar.gz")
sha256sums=('40164ad494a3d746184ea5c14db580c574df74aa86144ff033618bf4a684b213')

package() {
  cd "$srcdir/flaccy-linux-x86_64"
  install -Dm755 flaccy "$pkgdir/usr/bin/flaccy"
  install -Dm644 data/cc.midgarcorp.Flaccy.desktop "$pkgdir/usr/share/applications/cc.midgarcorp.Flaccy.desktop"
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "data/icons/hicolor/${size}x${size}/apps/cc.midgarcorp.Flaccy.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/cc.midgarcorp.Flaccy.png"
  done
}
