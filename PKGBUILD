# Maintainer: TheUnknownThing <TheUnknownThing@users.noreply.github.com>

pkgname=pcl-me-bin
pkgver=1.0.0beta.5
pkgrel=1
pkgdesc='Cross-platform Minecraft launcher based on Plain Craft Launcher'
arch=('x86_64' 'aarch64')
url='https://github.com/TheUnknownThing/PCL-ME'
license=('Apache-2.0' 'custom')
depends=(
  'fontconfig'
  'gcc-libs'
  'glibc'
  'libice'
  'libsm'
  'libx11'
  'libxcursor'
  'libxkbcommon'
  'libxrandr'
)
optdepends=(
  'java-runtime: launch Minecraft with a system Java runtime'
  'xdg-utils: open external links from the launcher'
)
provides=('pcl-me')
conflicts=('pcl-me')
options=('!strip')
_tag="v${pkgver/beta./-beta.}"
source=(
  'pcl-me.desktop'
  "pcl-me.png::https://raw.githubusercontent.com/TheUnknownThing/PCL-ME/${_tag}/PCL.Frontend.Avalonia/Assets/icon.png"
  "LICENSE::https://raw.githubusercontent.com/TheUnknownThing/PCL-ME/${_tag}/LICENSE"
  "FRONTEND-LICENSE::https://raw.githubusercontent.com/TheUnknownThing/PCL-ME/${_tag}/PCL.Frontend.Avalonia/LICENSE"
)
source_x86_64=("PCL-ME-linux-x64-${_tag}.tar.gz::https://github.com/TheUnknownThing/PCL-ME/releases/download/${_tag}/PCL-ME-linux-x64.tar.gz")
source_aarch64=("PCL-ME-linux-arm64-${_tag}.tar.gz::https://github.com/TheUnknownThing/PCL-ME/releases/download/${_tag}/PCL-ME-linux-arm64.tar.gz")
sha256sums=(
  'b73e6e493891de73ce0b4cc9eaa4779f603d5127690fddbad02d3fdc11fcc9d0'
  'ba6839bc4cfc1a1d2d3bf2cfa6bff3a2d53d2d919a4104428982b2da1d732c3d'
  '3999c85af1820068b476271815dec87d47ce531b92aaa45b10fa2f1333af408c'
  '15c72598c29e2646a8d3c900d53d7e5eb6926fc033373b725e8537245de98f0a'
)
sha256sums_x86_64=('cf372580610f4587f903a2adb15f0d18ab90a65d76b914a13ffc41cda616d551')
sha256sums_aarch64=('bdac86aea08fbd1dfcef88dcbfcac0cd29852f9b95a187729659c3165ef8ae67')

package() {
  install -Dm755 "${srcdir}/PCL-ME" "${pkgdir}/usr/bin/pcl-me"
  install -Dm644 "${srcdir}/pcl-me.desktop" "${pkgdir}/usr/share/applications/pcl-me.desktop"
  install -Dm644 "${srcdir}/pcl-me.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pcl-me.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/FRONTEND-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/FRONTEND-LICENSE"
}
