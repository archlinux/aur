pkgname=openssh-gui-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="A GUI for OpenSSH configuration and management (Binary version)"
arch=('x86_64')
url="https://github.com/frequency403/OpenSSH-GUI"
license=('MIT')
depends=('dotnet-runtime-9.0')
provides=('openssh-gui')
conflicts=('openssh-gui' 'openssh-gui-git')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/OpenSSH-GUI-linux-x64"
        "${pkgname}-icon-${pkgver}.png::${url}/raw/v${pkgver}/OpenSSH_GUI/Assets/appicon.png"
        "${pkgname}-desktop-${pkgver}.desktop::${url}/raw/v${pkgver}/openssh-gui.desktop"
        "${pkgname}-license-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('6fb2a77a39be10e0b4d880d24c15563f258f05ffa98d6423e9042e085854f755' 'de5104be112173655a8a5950a4b129e0f28d94e29b80239bf7c82360c524bf9c' '9d73c85e0e47fddf9e8930b42caf0f89b39df7f6088a9ca1a08d0c5d2ea5ff42' '04765b5ced4962532281a4c40754d25380df5e89e49bf3f0ea9054f05a6ee34a')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/openssh-gui"
  install -Dm644 "${pkgname}-icon-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openssh-gui.png"
  install -Dm644 "${pkgname}-desktop-${pkgver}.desktop" "${pkgdir}/usr/share/applications/openssh-gui.desktop"
  install -Dm644 "${pkgname}-license-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
