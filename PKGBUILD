pkgname=adwaita-network-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern network management application for GNOME (prebuilt binary)"
arch=('x86_64')
url="https://github.com/PlayRood32/adw-network"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'gdk-pixbuf2' 'networkmanager')
provides=('adwaita-network')
conflicts=('adwaita-network')
source=(
  "https://github.com/PlayRood32/adw-network/releases/download/v${pkgver}/adwaita-network-linux-x86_64.tar.gz"
  "com.github.adw-network.desktop::https://raw.githubusercontent.com/PlayRood32/adw-network/v${pkgver}/data/com.github.adw-network.desktop"
)
sha256sums=('9ebd666da424396cd2f8f3aa19bcf8c2c57ec14592518b72201cdc8704eebe41' 'SKIP')

package() {
  install -Dm755 "${srcdir}/adwaita-network" "${pkgdir}/usr/bin/adwaita-network"
  install -Dm644 "${srcdir}/com.github.adw-network.desktop" \
    "${pkgdir}/usr/share/applications/com.github.adw-network.desktop"
}
