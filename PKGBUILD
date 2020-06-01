# Maintainer: QuantMint <qua/nt/mint/@/tuta/nota.de>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
pkgname=godot-beta-bin
pkgver=3.2.2_beta3
pkgrel=1
pkgdesc='The latest official beta release of the Godot game engine'
url='https://godotengine.org'
license=('MIT')
arch=('i686' 'x86_64')
provides=('godot-beta-bin')
source=('godot-beta.desktop')
source_i686+=('https://downloads.tuxfamily.org/godotengine/3.2.2/beta3/Godot_v3.2.2-beta3_x11.32.zip')
source_x86_64+=('https://downloads.tuxfamily.org/godotengine/3.2.2/beta3/Godot_v3.2.2-beta3_x11.64.zip')
sha256sums=('53912a2e312559455045e8e83f6e239a2cbc6f891ebb393f441c772063bb9497')
sha512sums_i686=('e608f2521f157d256964a1af9ccf5e3148b819ac27a054fac84e635fe4a7342846233487965069a382170f3c93b090d7b455913ee129f46636fc7f5a5e164554')
sha512sums_x86_64=('7c4c639b132ff74d293d8b176ee379aa6064bc7db19f8633fc2d73b8001e2fe99e562a6b32a43f9d86e4e673beae17e71dc4884af90dbc49998b0577c8a3c324')

package() {
  ver=${pkgver/_/-}

  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"

  case $CARCH in
    "i686")
      cp "${srcdir}/Godot_v${ver}_x11.32" "${pkgdir}/opt/${pkgname}/godot-beta"
    ;;
    "x86_64")
      cp "${srcdir}/Godot_v${ver}_x11.64" "${pkgdir}/opt/${pkgname}/godot-beta"
    ;;
  esac

  cp "${srcdir}/godot-beta.desktop" "${pkgdir}/usr/share/applications/godot-beta.desktop"

  chmod +x "${pkgdir}/opt/${pkgname}/godot-beta"

  ln -s "/opt/${pkgname}/godot-beta" "${pkgdir}/usr/bin/godot-beta"
}
