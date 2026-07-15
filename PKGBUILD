# Maintainer: amoyrlet <amoyrlet@proton.me>
pkgname=teletify-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="Desktop music player that indexes and plays audio from your Telegram channels"
arch=('x86_64')
url="https://github.com/amoyrlet/teletify"
license=('custom')
provides=('teletify')
conflicts=('teletify')
depends=('webkit2gtk-4.1' 'gtk3' 'alsa-lib' 'openssl' 'hicolor-icon-theme')
source=("teletify-arch-installer-${pkgver}.tar.gz::https://github.com/amoyrlet/teletify/releases/download/v${pkgver}/teletify-arch-installer.tar.gz")
sha256sums=('87a27869e9ae52c0406cc48349c175a7a51603f9c8bb10f170add44d3643cb8f')

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
