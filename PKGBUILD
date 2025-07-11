# Maintainer: ricalditodepollo <richarclarinet at gmail dot com>
pkgname=balatro-multiplayer-launcher-bin
pkgver=1.0.11
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
  "aeed8fb36725968b004cbe686e025685d917b85756a5a86455d1da8cffc028c2"
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
