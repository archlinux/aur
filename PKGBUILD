# Maintainer: Stephen Steward <smstewa4 at protonmail dot com>
# Contributor: DannyChain <dev at dannychain dot anonaddy dot me>

_appname=app-outlet
pkgname=app-outlet-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="A Universal linux app store"
arch=("x86_64")
url="https://app-outlet.github.io"
license=("MIT")
source=(
  "${_appname}.AppImage::https://github.com/app-outlet/app-outlet/releases/download/v${pkgver}/App.Outlet-${pkgver}.AppImage"
  "app-outlet.desktop"
  "LICENSE"
  "icon.png"
)
sha256sums=('c8f39d7867e850d55fbd6fbb7495559901d042caa13da68607787cf1a61d46ca'
            '85f9535c10eb692f0edf9742ac06c1aa03b2c3afc61fcc9019a45b211a45ff83'
            'c24c91646674659de06c8dad229b589608a69be9403433b4b5efe856db4cecb8'
            'eed1d87a3f89afbd73898d331bcb484afc3862a0b67bc8b47d5c29aa97c55e5c'
)
package() {
  install -Dm644 ${_appname}.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/${_appname}.png"
  install -d "${pkgdir}/opt/${_appname}"
  mv ${_appname}.AppImage "$pkgdir/opt/${_appname}/${_appname}.AppImage"
  chmod +x "$pkgdir/opt/${_appname}/${_appname}.AppImage"
}
