# Maintainer: CipherDrop <hello@cipherdrop.app>

pkgname=cipherdrop-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Desktop wrapper for CipherDrop ephemeral end-to-end encrypted chat"
arch=('x86_64')
url="https://github.com/B3nixoff/cipherdrop"
license=('custom')
depends=(
  'gtk3'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'libdrm'
  'libxdamage'
  'libxrandr'
  'libxcomposite'
  'mesa'
)
optdepends=(
  'pipewire: screen sharing support'
  'libappindicator-gtk3: tray integration on some desktops'
)
provides=('cipherdrop')
conflicts=('cipherdrop')
options=(!strip)

# Replace the owner/repo below with the repository where you publish release assets.
_release_base="https://github.com/B3nixoff/cipherdrop/releases/download/v${pkgver}"
source=(
  "${pkgname}-${pkgver}.AppImage::${_release_base}/CipherDrop-Linux-${pkgver}-x86_64.AppImage"
  "cipherdrop.desktop"
)
sha256sums=(
  'SKIP'
  '8508379239ecfd54da2d4d16f87caea3e04eb9d5d3641798f4a31bc1f5466346'
)

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/CipherDrop/CipherDrop.AppImage"
  install -Dm644 "${srcdir}/cipherdrop.desktop" "${pkgdir}/usr/share/applications/cipherdrop.desktop"
  install -Dm644 "${startdir}/../../assets/icons/256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cipherdrop.png"
  install -Dm644 "${startdir}/../../assets/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/cipherdrop.png"
  install -Dm644 "${startdir}/../../assets/icons/64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/cipherdrop.png"
  install -Dm644 "${startdir}/../../assets/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/cipherdrop.png"
  install -Dm644 "${startdir}/../../assets/icons/16x16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/cipherdrop.png"
}
