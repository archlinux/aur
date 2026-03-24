pkgname=openssh-gui-nightly
pkgver=3.0.0.20260324.bee5b03
pkgrel=1
pkgdesc="A GUI for OpenSSH configuration and management (Nightly build from develop)"
arch=('x86_64')
url="https://github.com/frequency403/OpenSSH-GUI"
license=('MIT')
depends=('icu' 'openssl' 'zlib' 'krb5' 'libx11')
options=('!strip')
provides=('openssh-gui')
conflicts=('openssh-gui' 'openssh-gui-bin' 'openssh-gui-git')
source=("${pkgname}-${pkgver}::${url}/releases/download/nightly/OpenSSH-GUI-nightly-linux-x64"
        "${pkgname}-icon-${pkgver}.png::${url}/raw/develop/OpenSSH_GUI/Assets/appicon.png"
        "${pkgname}-desktop-${pkgver}.desktop::${url}/raw/develop/openssh-gui.desktop"
        "${pkgname}-license-${pkgver}::${url}/raw/develop/LICENSE")
sha256sums=('7bc37f39f83094d3b77daeb7d55901718ebfe83ddbfec18916fbab17ba9d0fdf' 'de5104be112173655a8a5950a4b129e0f28d94e29b80239bf7c82360c524bf9c' '96d9902c103bd057d0f6b5f571bb12bcfae4a457ed0022eaf34726fc0558c137' '04765b5ced4962532281a4c40754d25380df5e89e49bf3f0ea9054f05a6ee34a')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/openssh-gui"
  install -Dm644 "${pkgname}-icon-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openssh-gui.png"
  install -Dm644 "${pkgname}-desktop-${pkgver}.desktop" "${pkgdir}/usr/share/applications/openssh-gui.desktop"
  install -Dm644 "${pkgname}-license-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}