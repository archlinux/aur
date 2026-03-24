pkgname=openssh-gui-nightly
pkgver=3.0.0.20260324.c4e4fa0
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
sha256sums=('e4c29adce601ae4896093c510c0eeb13abb8cc7b675e7176194fadbff3161695' 'de5104be112173655a8a5950a4b129e0f28d94e29b80239bf7c82360c524bf9c' '9d73c85e0e47fddf9e8930b42caf0f89b39df7f6088a9ca1a08d0c5d2ea5ff42' '04765b5ced4962532281a4c40754d25380df5e89e49bf3f0ea9054f05a6ee34a')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/openssh-gui"
  install -Dm644 "${pkgname}-icon-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openssh-gui.png"
  install -Dm644 "${pkgname}-desktop-${pkgver}.desktop" "${pkgdir}/usr/share/applications/openssh-gui.desktop"
  install -Dm644 "${pkgname}-license-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}