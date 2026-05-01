# Maintainer: zaeyee <zaeyee@163.com>
pkgname=lynx-devtool
pkgver=0.1.2
pkgrel=2
pkgdesc="Debug Lynx On-the-Fly"
arch=("x86_64")
url="https://github.com/lynx-family/lynx-devtool"
license=("Apache-2.0")
depends=("fuse2" "gtk3" "nss" "libxss" "libxtst" "xdg-utils")
options=("!strip")
source=(
  "https://cnb.cool/zaeyee/open-source/lynx-devtool/-/releases/download/v${pkgver}/LynxDevTool-${pkgver}.AppImage"
  "${pkgname}.desktop"
  "${pkgname}.png::https://cnb.cool/zaeyee/open-source/lynx-devtool/-/git/raw/v${pkgver}/res/icons/lynx-devtool_256x256.png"
)
sha256sums=(
  "cdca4a054415f37c9520e182a995564443ab7d92db6858d3fd6f7f3734584673"
  "91765fa4430c48ed574f732d28d3fb21c16bde66a621b6bd5c7901c33f3da1bf"
  "d093412e18403e54af0ffcb5d325d50f5c05b6f398277f787bc18ec4a0b529ca"
)

package() {
  install -Dm755 "${srcdir}/LynxDevTool-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/LynxDevTool.AppImage"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}
