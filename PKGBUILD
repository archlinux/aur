# Maintainer: Keinv Yue <k3vinyue@gmail.com>

_pkgname_prefix=globalprotect-openconnect_2.0.0-beta1_
pkgname=globalprotect-openconnect-git
pkgver="2.0.0beta1"
pkgrel=1
pkgdesc="A GUI for GlobalProtect VPN, based on OpenConnect, supports the SSO authentication method."
arch=(x86_64 aarch64)
url="https://github.com/yuezk/GlobalProtect-openconnect"
license=('GPL3')
depends=('openconnect>=8.0.0' webkit2gtk libappindicator-gtk3 libayatana-appindicator libsecret libxml2)
optdepends=('wmctrl: for window management')

conflicts=('globalprotect-openconnect-git')
provides=('globalprotect-openconnect' 'gpclient' 'gpservice' 'gpauth' 'gpgui')

source_x86_64=("https://github.com/yuezk/GlobalProtect-openconnect/releases/download/v2.0.0-beta1/globalprotect-openconnect_2.0.0-beta1_x86_64.tar.gz")
source_aarch64=("https://github.com/yuezk/GlobalProtect-openconnect/releases/download/v2.0.0-beta1/globalprotect-openconnect_2.0.0-beta1_aarch64.tar.gz")

sha256sums_x86_64=("760e9dc969bd9e1dbf7bcea1ff6d7ce51f6a20089b180166e9b9d190a458617d")
sha256sums_aarch64=("73285a6bc0d31d223e8f2e230dc5f329fac48221ac5e304e7c65ca2ef765505d")


options=('!strip')

package() {
  _pkg=${_pkgname_prefix}${CARCH}

  install -Dm755 "${srcdir}/${_pkg}/usr/bin/gpclient" "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${_pkg}/usr/bin/gpservice" "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${_pkg}/usr/bin/gpauth" "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${_pkg}/usr/bin/gpgui" "${pkgdir}/usr/bin"

  install -Dm644 "${srcdir}/${_pkg}/usr/share/applications/gpgui.desktop" "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/${_pkg}/usr/share/icons/hicolor/scalable/apps/gpgui.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 "${srcdir}/${_pkg}/usr/share/icons/hicolor/32x32/apps/gpgui.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps"
  install -Dm644 "${srcdir}/${_pkg}/usr/share/icons/hicolor/128x128/apps/gpgui.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -Dm644 "${srcdir}/${_pkg}/usr/share/icons/hicolor/256x256@2/apps/gpgui.png" "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps"
  install -Dm644 "${srcdir}/${_pkg}/usr/share/polkit-1/actions/com.yuezk.gpgui.policy" "${pkgdir}/usr/share/polkit-1/actions"
}

