# Maintainer: Bilal ELmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=whatsapp-desktop
pkgrel=1
pkgver=0.4.0
pkgdesc="Unofficial whatsapp web desktop client. Build with Electron."
url="https://github.com/Enrico204/Whatsapp-Desktop"
provides=("whatsapp-desktop=${pkgver}")
arch=('x86_64')
license=('MIT')
depends=('notify-osd' 'libnotify' 'gconf' 'gtk2' 'lib32-libxss')
source=(
  "${url}/releases/download/v${pkgver}/WhatsApp-linux-x64.tar.gz"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
sha256sums=(
  '3db78dcdd03c0a1f5a518320735e38c29c2079b9797f3bd3a20219224563f2a6'
  '8153a94ecaff2f7466f1621571505a1f55135299cdcf4604fdfd2e7805cb94dc'
  'c128bdf1366f26b203c2a97b1284d66bd28d63c45812a7456385e1bf4afa27e4'
)
package() {
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/WhatsApp-linux-x64" "${pkgdir}/opt/Whatsapp"

  install -d "${pkgdir}/usr/bin"
  ln -sf "${pkgdir}/opt/Whatsapp/WhatsApp" "${pkgdir}/usr/bin/Whatsapp"

  install -D -m644 "./${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "./${pkgname}.png" \
      "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
