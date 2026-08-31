# Maintainer: omartelo <meopedevts@proton.me>
# Rendered by .github/workflows/release.yml (0.43.0 -> tag, checksums via
# updpkgsums) and pushed to the AUR — edit this template, never the AUR copy.
pkgname=lich-bin
pkgver=0.43.0
pkgrel=1
pkgdesc="A personal harness for AI-assisted development"
arch=('x86_64')
url="https://github.com/omartelo/lich"
license=('AGPL-3.0-only')
provides=('lich')
conflicts=('lich')
optdepends=('chromium: app window (any Chromium-family browser works: chromium, google-chrome, brave)'
            'zenity: native folder picker')
source=("lich-v${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/lich-v${pkgver}-linux-amd64"
        "lich-${pkgver}.desktop::https://raw.githubusercontent.com/omartelo/lich/v${pkgver}/build/linux/lich.desktop"
        "lich-${pkgver}.png::https://raw.githubusercontent.com/omartelo/lich/v${pkgver}/build/appicon.png")
sha256sums=('6d6f84515ea26e2fedac1580cc1e7875c23770e69eafa7d22a9d36a72740872c'
            'e39c9238b56be089973c254d031be152b3d990d3bc2735d866b044833a6c1a4d'
            '1575213b7d0ac3b3c832da61c856f29a839a2a0242abd34d3ab3ea9ae8c8a306')

package() {
  install -Dm755 "lich-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/lich"
  install -Dm644 "lich-${pkgver}.desktop" "${pkgdir}/usr/share/applications/lich.desktop"
  install -Dm644 "lich-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/lich.png"
}
