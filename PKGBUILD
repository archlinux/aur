# Maintainer: Marcos Gutiérrez Alonso <margual56@gmail.com>

pkgname=twingate-status-bin
pkgver=0.5.1
pkgrel=1
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
sha256sums=('2227ff509a59ab58f495ab2121f5a95ddfbf2672cff35219a40d68676e3c3000')
sha256sums_x86_64=('48e1b231c2b4efd4a6a80123b2f90db432d0b20464a9fb9214345a51e7a72e06')
sha256sums_aarch64=('c31c65b68004dc123d912cbef71e0ec19049022e79cb3e0e0b6c24d791bc1684')

source_x86_64=("https://codeberg.org/marcos56/twingate-status/releases/download/v${pkgver}/twingate_status-${pkgver}-x86_64")
source_aarch64=("https://codeberg.org/marcos56/twingate-status/releases/download/v${pkgver}/twingate_status-${pkgver}-aarch64")

package() {
  # Install the binary
  install -Dm755 "twingate_status-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/twingate-status"

  # Install the license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
