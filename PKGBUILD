# Maintainer: ricalditodepollo <richarclarinet at gmail dot com>
pkgname=balatro-multiplayer-launcher-bin
pkgver=1.0.13
pkgrel=1
pkgdesc="Launcher for Balatro Multiplayer Mod (pre-compiled binary)"
arch=('x86_64')
conflicts=("balatro-multiplayer-launcher")
provides=("balatro-multiplayer-launcher")
url="https://github.com/Balatro-Multiplayer/Balatro-Multiplayer-Launcher/"
license=(" ")

depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'libsecret'
  'alsa-lib'
  'cups'
  'dbus'
  'libdrm'
  'libx11'
  'libxcb'
  'libxkbcommon'
)

source=(
  "${url}releases/download/v${pkgver}/balatro-multiplayer-launcher.deb"

)
sha256sums=(
  "8825ba4b999e10371237d9e4bddb8dbdec6e7cea5dc00828aa2e655d16fdec97"
)

options=(!debug !strip)

prepare() {
  cd "${srcdir}"
  tar -xf data.tar.xz
}

package() {
  cp -r "${srcdir}/opt" "${pkgdir}/"
  cp -r "${srcdir}/usr" "${pkgdir}/"

  install -d "${pkgdir}/usr/bin"

  ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
