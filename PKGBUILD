# Maintainer: Keinv Yue <k3vinyue@gmail.com>

_pkgname_prefix=globalprotect-openconnect_2.0.0-beta4_
pkgname=globalprotect-openconnect-git
pkgver="2.0.0beta4"
pkgrel=1
pkgdesc="A GUI for GlobalProtect VPN, based on OpenConnect, supports the SSO authentication method."
arch=(x86_64 aarch64)
url="https://github.com/yuezk/GlobalProtect-openconnect"
license=('GPL3')
depends=('openconnect>=8.0.0' webkit2gtk libappindicator-gtk3 libayatana-appindicator libsecret libxml2)
optdepends=('wmctrl: for window management')

conflicts=('globalprotect-openconnect')
provides=('globalprotect-openconnect' 'gpclient' 'gpservice' 'gpauth' 'gpgui')

source_x86_64=("https://github.com/yuezk/GlobalProtect-openconnect/releases/download/v2.0.0-beta4/globalprotect-openconnect_2.0.0-beta4_x86_64.bin.tar.gz")
source_aarch64=("https://github.com/yuezk/GlobalProtect-openconnect/releases/download/v2.0.0-beta4/globalprotect-openconnect_2.0.0-beta4_aarch64.bin.tar.gz")

sha256sums_x86_64=("b264ce1aefca35c21443d9552a9a07895cff3473d0cbd2bb363da0a70e9fae92")
sha256sums_aarch64=("22610296717baaade4be50b0fb8928f596f08a3ec765a58e52ebc302618176e2")


options=('!strip')

package() {
  _pkg=${_pkgname_prefix}${CARCH}

  install -Dm755 "${srcdir}/${_pkg}/usr/bin/gpclient" "${pkgdir}/usr/bin/gpclient"
  install -Dm755 "${srcdir}/${_pkg}/usr/bin/gpservice" "${pkgdir}/usr/bin/gpservice"
  install -Dm755 "${srcdir}/${_pkg}/usr/bin/gpauth" "${pkgdir}/usr/bin/gpauth"
  install -Dm755 "${srcdir}/${_pkg}/usr/bin/gpgui" "${pkgdir}/usr/bin/gpgui"

  install -Dm644 "${srcdir}/${_pkg}/usr/share/applications/gpgui.desktop" "${pkgdir}/usr/share/applications/gpgui.desktop"
  install -Dm644 "${srcdir}/${_pkg}/usr/share/icons/hicolor/scalable/apps/gpgui.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gpgui.svg"
  install -Dm644 "${srcdir}/${_pkg}/usr/share/icons/hicolor/32x32/apps/gpgui.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gpgui.png"
  install -Dm644 "${srcdir}/${_pkg}/usr/share/icons/hicolor/128x128/apps/gpgui.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gpgui.png"
  install -Dm644 "${srcdir}/${_pkg}/usr/share/icons/hicolor/256x256@2/apps/gpgui.png" "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/gpgui.png"
  install -Dm644 "${srcdir}/${_pkg}/usr/share/polkit-1/actions/com.yuezk.gpgui.policy" "${pkgdir}/usr/share/polkit-1/actions/com.yuezk.gpgui.policy"
}

