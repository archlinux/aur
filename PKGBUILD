# Maintainer: DannyChain <dev@dannychain.anonaddy.me>

_appname=app-outlet
pkgname=app-outlet-bin
pkgver=1.3.4
pkgrel=4
pkgdesc="A Universal linux app store"
url="https://app-outlet.github.io"
arch=("x86_64")
license=("MIT")
source=(
  "${_appname}.AppImage::https://github.com/app-outlet/app-outlet/releases/download/v${pkgver}/App.Outlet-${pkgver}.AppImage"
  "app-outlet.desktop"
  "LICENSE"
  "icon.png"
)
sha256sums=(
  "81ffabda2dd6f049cd41ac58056463c93197bf19ad8f245b333f2b6cd9914ed5"
  "80fbc53f25a545b042e80ad71801ce680cce1a625c55f00aeb6b5a00d11cb507"
  "8aba9d7f0845dbd30493aa751441f3e63ba32f12a526aa028ff155196d3f2393"
  "0330721088dee7e9f88ed35e254fa9843a87fdc2c4996a50ac26adf2adf77818"
)

package() {
  install -Dm644 ${_appname}.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/${_appname}.png"
  install -d "${pkgdir}/opt/${_appname}"
  mv ${_appname}.AppImage "$pkgdir/opt/${_appname}/${_appname}.AppImage"
  chmod +x "$pkgdir/opt/${_appname}/${_appname}.AppImage"
}
