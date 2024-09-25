# Maintainer: Tom Hetmer <tom.hetmer / outlook.cz>
# Maintainer: Daniel Milde <daniel / milde.cz>

pkgname=winbox
pkgver=4.0beta8
pkgrel=1
pkgdesc="Mikrotik RouterOS GUI Configurator"
url="https://mikrotik.com/download"
arch=('x86_64')
license=('custom')
depends=('desktop-file-utils'
         'fontconfig'
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
         'xdg-utils'
         'zlib')
source=("WinBox-${pkgver}.zip::https://download.mikrotik.com/routeros/winbox/${pkgver}/WinBox_Linux.zip"
        "${pkgname}.desktop")
install=${pkgname}.install
sha256sums=('2361fe66fa8d14c05f1ab5db4c547b2162d70cd5330ac9c7e6ec29d1da5bae19'
            'c11b68ce68627c15e92ae298209d1e519cf57e7ea626160674f374929b7a2f88')

package() {
  install -D -m0755 "${srcdir}/WinBox" "${pkgdir}/usr/bin/WinBox"
  install -D -m0644 "${srcdir}/assets/img/winbox.png" "${pkgdir}/usr/share/pixmaps/winbox.png"
  install -D -m0644 "${srcdir}/winbox.desktop" "${pkgdir}/usr/share/applications/winbox.desktop"
}
