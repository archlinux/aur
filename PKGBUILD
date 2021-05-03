# Maintainer: DannyChain <dev@dannychain.anonaddy.me>

_appname=app-outlet
pkgname=app-outlet-bin
pkgver=1.3.4
pkgrel=1
pkgdesc="A Universal linux app store"
url="https://app-outlet.github.io"
arch=("x86_64")
license=("MIT")
source=(
  "${_appname}-${pkgver}.AppImage::https://github.com/app-outlet/app-outlet/releases/download/v${pkgver}/App.Outlet-${pkgver}.AppImage"
)
sha256sums=("81ffabda2dd6f049cd41ac58056463c93197bf19ad8f245b333f2b6cd9914ed5")

package() {
  install -Dm644 ${_appname}.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/${_appname}.png"
  install -d "${pkgdir}/opt/${_appname}"
  cp -r ${_appname}-${pkgver}.AppImage "$pkgdir/opt/${_appname}/${_appname}.AppImage"
}
