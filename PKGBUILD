# Maintainer: Bilal ELmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=whatsapp-desktop
pkgrel=2
pkgver=0.4.2
pkgdesc="Unofficial whatsapp web desktop client. Build with Electron."
url="https://github.com/Enrico204/Whatsapp-Desktop"
provides=("whatsapp-desktop=${pkgver}")
arch=('i686' 'x86_64' 'armv7l')
license=('MIT')
depends=('notify-osd' 'libnotify' 'gconf' 'gtk2' 'libxss')
source=(
  "${pkgname}.desktop"
  "${pkgname}.png"
)
source_x86_64+=(
  "${url}/releases/download/v${pkgver}/WhatsApp-linux-x64.tar.gz"
)
source_i686+=(
  "${url}/releases/download/v${pkgver}/WhatsApp-linux-ia32.tar.gz"
)
source_armv7l+=(
  "${url}/releases/download/v${pkgver}/WhatsApp-linux-armv7l.tar.gz"
)

sha256sums=(
  '8153a94ecaff2f7466f1621571505a1f55135299cdcf4604fdfd2e7805cb94dc'
  'c128bdf1366f26b203c2a97b1284d66bd28d63c45812a7456385e1bf4afa27e4'
)

sha256sums_x86_64=(
  '0e754f65a5e205857f7ec4815d3e62b31c1c09be30257fc8689e7af2f6ca2d33'
)

sha256sums_i686=(
  '0d6a119fcf748c4b8ffd39658080cff47b1e8c4b5c2a798e8baaa11c20d73491'
)

sha256sums_armv7l=(
  '7cc7de81edb0b186533a83bc11e1c0f657fe84118a04f76148e8dfc5418931a7'
)


package() {
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/WhatsApp-linux-x64" "${pkgdir}/opt/Whatsapp"

  install -d "${pkgdir}/usr/bin"
  ln -sf "../../opt/Whatsapp/WhatsApp" "${pkgdir}/usr/bin/Whatsapp"

  install -D -m644 "./${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "./${pkgname}.png" \
      "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
