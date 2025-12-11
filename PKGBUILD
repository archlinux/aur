# Maintainer: Tom Hetmer <tom.hetmer / outlook.cz>
# Maintainer: Daniel Milde <daniel / milde.cz>

pkgname=winbox
pkgver=4.0beta44
pkgrel=1
pkgdesc='Mikrotik RouterOS GUI Configurator'
url='https://mikrotik.com/download'
arch=('x86_64')
license=('custom')
depends=('fontconfig'
         'freetype2'
         'glibc'
         'libglvnd'
         'libxcb'
         'libxkbcommon'
         'libxkbcommon-x11'
         'xcb-util-image'
         'xcb-util-keysyms'
         'xcb-util-renderutil'
         'xcb-util-wm'
         'zlib')
source=("WinBox-${pkgver}.zip::https://download.mikrotik.com/routeros/winbox/${pkgver}/WinBox_Linux.zip"
        "${pkgname}.desktop")
install=${pkgname}.install
sha256sums=('2cfabb28f3a3e7d354868402c690155bca9b8d7246c51c3c7d1253effa83b593'
            '2880ba075a3a5d75113707bbf642bd6018f0eb40a2d725d6adfe8d5d2ee14425')

package() {
  install -D -m0755 "${srcdir}/WinBox" "${pkgdir}/usr/bin/WinBox"
  install -D -m0644 "${srcdir}/assets/img/winbox.png" "${pkgdir}/usr/share/pixmaps/winbox.png"
  install -D -m0644 "${srcdir}/winbox.desktop" "${pkgdir}/usr/share/applications/winbox.desktop"
}
