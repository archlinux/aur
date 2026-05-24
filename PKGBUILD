# Maintainer: Marcos Gutiérrez Alonso <margual56@gmail.com>

pkgname=twingate-status-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="A tray notification for your Twingate status"
url="https://codeberg.org/marcos56/twingate-status"
license=('GPL3')
arch=('x86_64' 'aarch64')
provides=('twingate-status')
conflicts=('twingate-status')

depends=('dbus')
optdepends=('gnome-shell-extension-appindicator: Required to display the tray icon in GNOME environments')

# Download the raw plain-text license file
source=("https://codeberg.org/marcos56/twingate-status/raw/tag/v${pkgver}/LICENSE")
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

source_x86_64=("https://codeberg.org/marcos56/twingate-status/releases/download/v${pkgver}/twingate_status-x86_64")

source_aarch64=("https://codeberg.org/marcos56/twingate-status/releases/download/v${pkgver}/twingate_status-aarch64")

package() {
  # Install the binary
  install -Dm755 "twingate_status-${CARCH}" "${pkgdir}/usr/bin/twingate-status"

  # Install the license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
