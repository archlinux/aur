# Maintainer: Tom Hetmer <tom.hetmer / outlook.cz>
# Maintainer: Daniel Milde <daniel / milde.cz>

pkgname=winbox
pkgver=4.0.1
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
sha256sums=('8ec2d08929fd434c4b88881f3354bdf60b057ecd2fb54961dd912df57e326a70'
            '2880ba075a3a5d75113707bbf642bd6018f0eb40a2d725d6adfe8d5d2ee14425')

package() {
  install -D -m0755 "${srcdir}/WinBox" "${pkgdir}/usr/bin/WinBox"
  install -D -m0644 "${srcdir}/assets/img/winbox.png" "${pkgdir}/usr/share/pixmaps/winbox.png"
  install -D -m0644 "${srcdir}/winbox.desktop" "${pkgdir}/usr/share/applications/winbox.desktop"
}
