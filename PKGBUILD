# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

pkgname="winbox43"
pkgver="4.3"
pkgrel="1"
pkgdesc="Mikrotik RouterOS GUI Configurator (version 4.3 because winbox is shit and new versions don't work)"
url="https://mikrotik.com/download"
arch=("x86_64")
license=("custom")
options=("!debug")
depends=("fontconfig" "freetype2" "glibc" "libglvnd" "libxcb" "libxkbcommon" "libxkbcommon-x11" "xcb-util-image" "xcb-util-keysyms" "xcb-util-renderutil" "xcb-util-wm" "zlib")
source=("WinBox-${pkgver}.zip::https://download.mikrotik.com/routeros/winbox/${pkgver}/WinBox_Linux.zip" "winbox43.desktop")

sha256sums=("573600ac24df38a7a06ea4318b12754247eec4b54c6c90b0a57100d676787a4c" "87f114bb57cd57efda4d2600fdce31f9c1229965f3cd049f6c85e7471cdcc2a2")

package() {
  install -Dm755 "${srcdir}/WinBox" "${pkgdir}/usr/bin/WinBox43"
  install -Dm644 "${srcdir}/assets/img/winbox.png" "${pkgdir}/usr/share/pixmaps/winbox43.png"
  install -Dm644 "${srcdir}/winbox43.desktop" "${pkgdir}/usr/share/applications/winbox43.desktop"
}
