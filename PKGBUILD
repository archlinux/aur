# Maintainer: amoyrlet <amoyrlet@proton.me>
pkgname=teletify-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Desktop music player that indexes and plays audio from your Telegram channels"
arch=('x86_64')
url="https://github.com/amoyrlet/teletify"
license=('custom')
provides=('teletify')
conflicts=('teletify')
depends=('webkit2gtk-4.1' 'gtk3' 'alsa-lib' 'openssl' 'hicolor-icon-theme')
source=("teletify-arch-installer-${pkgver}.tar.gz::https://github.com/amoyrlet/teletify/releases/download/v${pkgver}/teletify-arch-installer.tar.gz")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
  cd "$srcdir/teletify-arch"

  install -Dm755 teletify-arch-x86_64 "$pkgdir/usr/bin/teletify"
  install -Dm644 teletify.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/teletify.png"

  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/teletify.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=teletify
Comment=${pkgdesc}
Exec=teletify
Icon=teletify
Terminal=false
Categories=AudioVideo;Audio;Player;
StartupWMClass=teletify
EOF
  chmod 644 "$pkgdir/usr/share/applications/teletify.desktop"
}
