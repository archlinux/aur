# Maintainer Shimi Chen <shimi.chen@gmail.com>
# Contributer Bilal ELmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=whatsapp-desktop-electron-bin
pkgrel=1
pkgver=0.5.0
pkgdesc="Unofficial whatsapp web desktop client (binary version). Built with Electron."
url="https://github.com/Enrico204/Whatsapp-Desktop"
provides=("whatsapp-desktop=${pkgver}")
arch=('i686' 'x86_64' 'armv7l')
license=('MIT')
depends=('notify-osd' 'libnotify' 'gconf' 'gtk2' 'libxss')
conflicts=('whatsapp-desktop')
source=(
  "${pkgname}.desktop"
  "${pkgname}.png"
)
source_x86_64+=(
  "${url}/releases/download/v${pkgver}/WhatsApp-v${pkgver}-linux-x64.tar.gz"
)
source_i686+=(
  "${url}/releases/download/v${pkgver}/WhatsApp-v${pkgver}-linux-ia32.tar.gz"
)
source_armv7l+=(
  "${url}/releases/download/v${pkgver}/WhatsApp-v${pkgver}-linux-armv7l.tar.gz"
)

sha256sums=('ff9a87c8fd31adc9a587707e9af09dcbaf4d2919e40073f0715413fd333b1880'
            'c128bdf1366f26b203c2a97b1284d66bd28d63c45812a7456385e1bf4afa27e4')
sha256sums_i686=('32ecd9960903d0b972af14e0bc67f7406956e1b5d1268d6d78186bed0fe6ae46')
sha256sums_x86_64=('2063ea3bcdd991e3b39d45b8caa2fc1bcd4cd91049b63e704824d0c0a92d0a06')
sha256sums_armv7l=('6843b6889dce5215170506ad7b232caf94289b219e56abe8439b34e12676d30e')





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
