# Maintainer: Marcos Gutiérrez Alonso <margual56@gmail.com>

pkgname=twingate-status-bin
pkgver=0.5.0
pkgrel=0
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
sha256sums_x86_64=('4b25946d7fa50ff402d12ced1270ee57d96612bbb25e1a5a8ad3e122cea26312')
sha256sums_aarch64=('3d00f7b6065b034a0529888cf0d1578dd0098205e3510f94935883be69fbbb9d')

source_x86_64=("https://codeberg.org/marcos56/twingate-status/releases/download/v${pkgver}/twingate_status-${pkgver}-x86_64")
source_aarch64=("https://codeberg.org/marcos56/twingate-status/releases/download/v${pkgver}/twingate_status-${pkgver}-aarch64")

package() {
  # Install the binary
  install -Dm755 "twingate_status-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/twingate-status"

  # Install the license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
