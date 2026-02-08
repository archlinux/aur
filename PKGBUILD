pkgname=adw-network-bin
pkgver=0.1.2
pkgrel=2
pkgdesc="Modern network management application for GNOME (prebuilt binary)"
arch=('x86_64')
url="https://github.com/PlayRood32/adw-network"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'gdk-pixbuf2' 'networkmanager')
provides=('adwaita-network')
conflicts=('adwaita-network')
source=(
  "https://github.com/PlayRood32/adw-network/releases/download/v${pkgver}/adwaita-network-linux-x86_64.tar.gz"
  "com.github.adw-network.desktop::https://raw.githubusercontent.com/PlayRood32/adw-network/v0.1.2/data/com.github.adw-network.desktop"
  "icon.png::https://raw.githubusercontent.com/PlayRood32/adw-network/main/data/icons/hicolor/scalable/apps/icon.png"
)
sha256sums=('59869db34853933b239f1e2219cf7d431da006aa919635478511fabbfc8849d2'
            '8ee3b310cbb8c01b66eea5d4270caa71246c907ea9e020efd9f8e398be9a7e56'
            '518a328abee19239ba5f20bcbfe3f15c474bc5c18b8adcb37c9793ecf7c640cc')

package() {
  install -Dm755 "${srcdir}/adwaita-network" "${pkgdir}/usr/bin/adwaita-network"
  install -Dm644 "${srcdir}/com.github.adw-network.desktop" \
    "${pkgdir}/usr/share/applications/com.github.adw-network.desktop"
  install -Dm644 "${srcdir}/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/icon.png"
}
