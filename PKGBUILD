pkgname=fygram-bin
pkgver=0.6.0
pkgrel=3
pkgdesc="Desktop music player that indexes and plays audio from your Telegram channels"
arch=('x86_64')
url="https://github.com/amoyrlet-tg/fygram"
license=('Apache-2.0')
provides=('fygram')
conflicts=('fygram')
depends=('webkit2gtk-4.1' 'gtk3' 'alsa-lib' 'openssl' 'hicolor-icon-theme')
options=('!strip' '!debug')
source=("fygram-arch-installer-${pkgver}.tar.gz::https://github.com/amoyrlet-tg/fygram/releases/download/v${pkgver}/fygram-arch-installer.tar.gz")
sha256sums=('c484e1ca113aecf43eeef11a2bbd2805ce3225dc5a069343504ceecb7e949a37')

package() {
  cd "$srcdir/fygram-arch"

  install -Dm755 fygram-arch-x86_64 "$pkgdir/usr/bin/fygram"
  install -Dm644 fygram.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/fygram.png"

  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/fygram.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=fygram
Comment=${pkgdesc}
Exec=fygram
Icon=fygram
Terminal=false
Categories=AudioVideo;Audio;Player;
StartupWMClass=fygram
EOF
  chmod 644 "$pkgdir/usr/share/applications/fygram.desktop"
}
