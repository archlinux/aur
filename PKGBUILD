pkgname=openssh-gui-nightly
pkgver=1.0.0.20260316.abc1234
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
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/openssh-gui"
  install -Dm644 "${pkgname}-icon-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openssh-gui.png"
  install -Dm644 "${pkgname}-desktop-${pkgver}.desktop" "${pkgdir}/usr/share/applications/openssh-gui.desktop"
  install -Dm644 "${pkgname}-license-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}