# Maintainer: Marcos Gutiérrez Alonso <margual56@gmail.com>

pkgname=twingate-status-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A tray notification for your Twingate status"
url="https://codeberg.org/marcos56/twingate-status"
license=('GPL2')
arch=('x86_64' 'aarch64')
provides=('twingate-status')
conflicts=('twingate-status')

depends=('dbus')
optdepends=('gnome-shell-extension-appindicator: Required to display the tray icon in GNOME environments')

# Download the raw plain-text license file
source=("https://codeberg.org/marcos56/twingate-status/raw/tag/v${pkgver}/LICENSE")
sha256sums=('2227ff509a59ab58f495ab2121f5a95ddfbf2672cff35219a40d68676e3c3000')
sha256sums_x86_64=('aa19f5930b327e59a618dbe8b6a394d9f8e8d78d7c33368c6097ac5cdd18913e')
sha256sums_aarch64=('e77facfb5c25e07493e6dc80010d1a55b8b7b273561ac4a855f3b393d8fdd860')

source_x86_64=("https://codeberg.org/marcos56/twingate-status/releases/download/v${pkgver}/twingate_status-x86_64")

source_aarch64=("https://codeberg.org/marcos56/twingate-status/releases/download/v${pkgver}/twingate_status-aarch64")

package() {
  # Install the binary
  install -Dm755 "twingate_status-${CARCH}" "${pkgdir}/usr/bin/twingate-status"

  # Install the license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
