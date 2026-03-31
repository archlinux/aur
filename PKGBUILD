# Maintainer: CipherDrop <hello@cipherdrop.app>

pkgname=cipherdrop-bin
pkgver=0.1.0
pkgrel=2
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
  "16x16.png"
  "32x32.png"
  "64x64.png"
  "128x128.png"
  "256x256.png"
)
sha256sums=(
  'SKIP'
  '564d08924f32c42f52f15c8a9c5fc98c0af083d3c92881f2f32ec367409acbe8'
  '9c8e6e3c45f4b7c9794736bc3191604dd25da4eab34bd63e375c55388c3074da'
  '170bb946b64ce0b062bce98268477e994f6c9c30fce4d2ecdc6f822e2425a15c'
  'bebe952ce9c9eb3f661263d71522ba5eb20ae86d1e94121e3799d577a1126675'
  'fabb1f4962e4dc272d6d8748604abd546858da253f74a47e825df892c9829742'
  '3f3452cda13bf3f4b990eed2951a56012523db6f6d61ebe3b1572694a66f89f3'
)

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/CipherDrop/CipherDrop.AppImage"
  install -Dm644 "${srcdir}/cipherdrop.desktop" "${pkgdir}/usr/share/applications/cipherdrop.desktop"
  install -Dm644 "${srcdir}/256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cipherdrop.png"
  install -Dm644 "${srcdir}/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/cipherdrop.png"
  install -Dm644 "${srcdir}/64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/cipherdrop.png"
  install -Dm644 "${srcdir}/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/cipherdrop.png"
  install -Dm644 "${srcdir}/16x16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/cipherdrop.png"
}
