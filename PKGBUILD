# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-desktop
pkgver=0.1.34
pkgrel=1
pkgdesc="Agentics Desktop - the PowerBoard wallpaper companion and desktop agent host"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-desktop-0.1.34-x86_64.AppImage::https://repo.agentics.co.za/x86_64/agentics-desktop-0.1.34-x86_64.AppImage")
sha512sums=('48323e47740d2d1e22792b0d4a2de141b98cf2eb8ae6f6c6f8e1dcde0552d58936eecef4081bb78e8b109434ed8c933c60c1739b49bf053e0cc66e60ef34f584')

package() {
  install -Dm755 "$srcdir/agentics-desktop-0.1.34-x86_64.AppImage" "$pkgdir/opt/agentics/AgenticsDesktop.AppImage"
  install -dm755 "$pkgdir/usr/bin"
  printf '%s\n' '#!/bin/sh' 'exec /opt/agentics/AgenticsDesktop.AppImage "$@"' > "$pkgdir/usr/bin/agentics-desktop"
  chmod 755 "$pkgdir/usr/bin/agentics-desktop"
}
