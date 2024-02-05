# Maintainer: Keinv Yue <k3vinyue@gmail.com>

_pkgname_prefix=globalprotect-openconnect_2.0.0_
pkgname=globalprotect-openconnect-git
pkgver="2.0.0"
pkgrel=1
pkgdesc="A GUI for GlobalProtect VPN, based on OpenConnect, supports the SSO authentication method."
arch=(x86_64 aarch64)
url="https://github.com/yuezk/GlobalProtect-openconnect"
license=('GPL3')
depends=('openconnect>=8.20' webkit2gtk libappindicator-gtk3 libayatana-appindicator libsecret libxml2)
optdepends=('wmctrl: for window management')

conflicts=('globalprotect-openconnect')
provides=('globalprotect-openconnect' 'gpclient' 'gpservice' 'gpauth' 'gpgui')

source_x86_64=("https://github.com/yuezk/GlobalProtect-openconnect/releases/download/v2.0.0/globalprotect-openconnect_2.0.0_x86_64.bin.tar.gz")
source_aarch64=("https://github.com/yuezk/GlobalProtect-openconnect/releases/download/v2.0.0/globalprotect-openconnect_2.0.0_aarch64.bin.tar.gz")

sha256sums_x86_64=("7a0f7e483092c192df57381c31c8a2b1c03eec7ea7c3b9cb51a3c118c7ae8553")
sha256sums_aarch64=("1d6dd76c2d28134d18e13455054d38580e21e37b707f14db51f2b1e5b9ffc68c")


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

