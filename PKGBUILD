# Maintainer: DannyChain <dev@dannychain.anonaddy.me>

_appname=app-outlet
pkgname=app-outlet-bin
pkgver=1.3.4
pkgrel=2
pkgdesc="A Universal linux app store"
url="https://app-outlet.github.io"
arch=("x86_64")
license=("MIT")
source=(
  "${_appname}-${pkgver}.AppImage::https://github.com/app-outlet/app-outlet/releases/download/v${pkgver}/App.Outlet-${pkgver}.AppImage"
  "app-outlet.desktop"
  "LICENSE"
  "icon.png"
)
sha256sums=(
  "81ffabda2dd6f049cd41ac58056463c93197bf19ad8f245b333f2b6cd9914ed5"
  "bdd009a6d8a15aa5b890e2f3beb0c7d3509524fd980a80404af57b280929d7e0"
  "8aba9d7f0845dbd30493aa751441f3e63ba32f12a526aa028ff155196d3f2393"
  "0330721088dee7e9f88ed35e254fa9843a87fdc2c4996a50ac26adf2adf77818"
)

package() {
  install -Dm644 ${_appname}.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/${_appname}.png"
  install -d "${pkgdir}/opt/${_appname}"
  cp -r ${_appname}-${pkgver}.AppImage "$pkgdir/opt/${_appname}/${_appname}.AppImage"
  chmod +x "$pkgdir/opt/${_appname}/${_appname}.AppImage"
}
