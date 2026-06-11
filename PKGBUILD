pkgname=openssh-gui-bin
pkgver=3.1.6
pkgrel=1
pkgdesc="A GUI for OpenSSH configuration and management (Binary version)"
arch=('x86_64')
url="https://github.com/frequency403/OpenSSH-GUI"
license=('MIT')

depends=('icu' 'openssl' 'zlib' 'krb5' 'libx11')
options=('!strip')

provides=('openssh-gui')
conflicts=('openssh-gui' 'openssh-gui-git' 'openssh-gui-nightly')

_relurl="https://github.com/frequency403/OpenSSH-GUI/releases/download/v${pkgver}"
_rawurl="https://raw.githubusercontent.com/frequency403/OpenSSH-GUI/v${pkgver}"

source=(
  "${pkgname}-${pkgver}::${_relurl}/OpenSSH-GUI-linux-x64"
  "${pkgname}-icon-${pkgver}.png::${_relurl}/appicon.png"
  "${pkgname}-desktop-${pkgver}.desktop::${_relurl}/io.github.frequency403.openssh_gui.desktop"
  "${pkgname}-license-${pkgver}::${_rawurl}/LICENSE"
)

sha256sums=('427f4218143c39155345a9f33292099e3288d44008078fd8463f35ee13bf807b' '19d7c119dcd8aaf1b2bac47325ebf73ac4b32bb3f757e62276a154845be49774' '0f53f092ae5b6a8547d016d3c4130c9352fe4af688e0eaaee7c94efdadb78470' '04765b5ced4962532281a4c40754d25380df5e89e49bf3f0ea9054f05a6ee34a')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" \
    "${pkgdir}/usr/bin/openssh-gui"

  install -Dm644 "${srcdir}/${pkgname}-icon-${pkgver}.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openssh-gui.png"

  install -Dm644 "${srcdir}/${pkgname}-desktop-${pkgver}.desktop" \
    "${pkgdir}/usr/share/applications/io.github.frequency403.openssh_gui.desktop"

  install -Dm644 "${srcdir}/${pkgname}-license-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}