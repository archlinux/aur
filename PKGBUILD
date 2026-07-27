# Maintainer: omartelo <meopedevts@proton.me>
# Rendered by .github/workflows/release.yml (0.21.1 -> tag, checksums via
# updpkgsums) and pushed to the AUR — edit this template, never the AUR copy.
pkgname=lich-bin
pkgver=0.21.1
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
sha256sums=('812c5befe9c513f5bbed471fcfe388412aa31097048e35df1481b9b8d8827b83'
            'b5f6635d59ef2b178cdf5788798fa4bac6b66505830c3b1b1f93bf8fe90dca8e'
            'd61ff3a75bfa9845b330a6d2ddeddb2450a2795d9e64338b2f05261e5eedc2c3')

package() {
  install -Dm755 "lich-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/lich"
  install -Dm644 "lich-${pkgver}.desktop" "${pkgdir}/usr/share/applications/lich.desktop"
  install -Dm644 "lich-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/lich.png"
}
