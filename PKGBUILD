# Maintainer: Keinv Yue <k3vinyue@gmail.com>

_pkgname_prefix=globalprotect-openconnect_2.0.0-beta3_
pkgname=globalprotect-openconnect-git
pkgver="2.0.0beta3"
pkgrel=1
pkgdesc="A GUI for GlobalProtect VPN, based on OpenConnect, supports the SSO authentication method."
arch=(x86_64 aarch64)
url="https://github.com/yuezk/GlobalProtect-openconnect"
license=('GPL3')
depends=('openconnect>=8.0.0' webkit2gtk libappindicator-gtk3 libayatana-appindicator libsecret libxml2)
optdepends=('wmctrl: for window management')

conflicts=('globalprotect-openconnect')
provides=('globalprotect-openconnect' 'gpclient' 'gpservice' 'gpauth' 'gpgui')

source_x86_64=("https://github.com/yuezk/GlobalProtect-openconnect/releases/download/v2.0.0-beta3/globalprotect-openconnect_2.0.0-beta3_x86_64.bin.tar.gz")
source_aarch64=("https://github.com/yuezk/GlobalProtect-openconnect/releases/download/v2.0.0-beta3/globalprotect-openconnect_2.0.0-beta3_aarch64.bin.tar.gz")

sha256sums_x86_64=("72635be4cd806f87f18c974510efe03f85716d0568801c5637db709517cc9bb0")
sha256sums_aarch64=("f0fee15eebcc3c456f99e941bf531b0938d982cfd864886e8b8b7c735020c786")


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

