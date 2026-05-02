# Maintainer: zaeyee <zaeyee@163.com>
pkgname=lynx-devtool
pkgver=0.1.1
pkgrel=1
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
sha256sums=('e90fdd19524c554f458cade3bab2a8c5b6f5c68ec536b921eaea92d518eda26c'
            '91765fa4430c48ed574f732d28d3fb21c16bde66a621b6bd5c7901c33f3da1bf'
            'd093412e18403e54af0ffcb5d325d50f5c05b6f398277f787bc18ec4a0b529ca')

package() {
  install -Dm755 "${srcdir}/LynxDevTool-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/LynxDevTool.AppImage"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}
