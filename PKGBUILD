# Maintainer: Julius Dehner <julius.dehner@protonmail.com>

pkgname=plexamp-appimg
pkgver=3.0.1
pkgrel=0
pkgdesc="Music focused client for Plex"
provides=('plexamp')
conflicts=('plexamp')
arch=('x86_64')
url="https://plexamp.plex.tv"
options=(!strip)
source=(
  ${url}/plexamp.plex.tv/desktop/Plexamp-${pkgver}.AppImage
)
sha512sums=(
  SKIP
)

package() {
  echo "Starting install"
  Plexamp-${pkgver}.AppImage --appimage-extract plexamp.desktop
  install -Dm755 Plexamp-${pkgver}.AppImage "$pkgdir"/usr/bin/Plexamp.AppImage
  echo 'Installing desktop launch file to "$pkgdir"/usr/bin/Plexamp.AppImage'
  install -Dm755 plexamp.desktop "$pkgdir"/usr/share/applications/plexamp.desktop
}
