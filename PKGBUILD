# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-desktop
pkgver=0.1.45
pkgrel=1
pkgdesc="Agentics Desktop - the PowerBoard wallpaper companion and desktop agent host"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-desktop-0.1.45-x86_64.AppImage::https://repo.agentics.co.za/x86_64/agentics-desktop-0.1.45-x86_64.AppImage")
sha512sums=('6c5e1b054c7b1277f91648a804693aae5aa579ee5c493c0a39ad30b89849ec0c775250bcc160e5cb34dcfe734fd08ac96e9c609e6e11d540577664dfeceb3af0')

package() {
  install -Dm755 "$srcdir/agentics-desktop-0.1.45-x86_64.AppImage" "$pkgdir/opt/agentics/AgenticsDesktop.AppImage"
  install -dm755 "$pkgdir/usr/bin"
  printf '%s\n' '#!/bin/sh' 'exec /opt/agentics/AgenticsDesktop.AppImage "$@"' > "$pkgdir/usr/bin/agentics-desktop"
  chmod 755 "$pkgdir/usr/bin/agentics-desktop"
}
