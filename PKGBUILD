# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-desktop
pkgver=0.1.46
pkgrel=1
pkgdesc="Agentics Desktop - the PowerBoard wallpaper companion and desktop agent host"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-desktop-0.1.46-x86_64.AppImage::https://repo.agentics.co.za/x86_64/agentics-desktop-0.1.46-x86_64.AppImage")
sha512sums=('14b6770bbec241fbb6f537f3b6938a6498f15919701e597fa4ad4aa54e5524eff0bb120e1c2be0cb0fc7917e2272490b6ebef44b30a58ae7e3f2b28eddbb13bb')

package() {
  install -Dm755 "$srcdir/agentics-desktop-0.1.46-x86_64.AppImage" "$pkgdir/opt/agentics/AgenticsDesktop.AppImage"
  install -dm755 "$pkgdir/usr/bin"
  printf '%s\n' '#!/bin/sh' 'exec /opt/agentics/AgenticsDesktop.AppImage "$@"' > "$pkgdir/usr/bin/agentics-desktop"
  chmod 755 "$pkgdir/usr/bin/agentics-desktop"
}
