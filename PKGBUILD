# Maintainer: QuantMint <qua/nt/mint/@/tuta/nota.de>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
pkgname=godot-beta-bin
pkgver=3.2.4_beta3
_v1=3.2.4
_v2=beta3
pkgrel=1
pkgdesc='The latest official beta release of the Godot game engine'
url='https://godotengine.org'
license=('MIT')
arch=('i686' 'x86_64')
provides=('godot-beta-bin')
source=('godot-beta.desktop')
source_i686+=("https://downloads.tuxfamily.org/godotengine/$_v1/$_v2/Godot_v${_v1}-${_v2}_x11.32.zip")
source_x86_64+=("https://downloads.tuxfamily.org/godotengine/$_v1/$_v2/Godot_v${_v1}-${_v2}_x11.64.zip")
sha256sums=('53912a2e312559455045e8e83f6e239a2cbc6f891ebb393f441c772063bb9497')
sha512sums_i686=('520a3800310f15a8f2768e4f116fc37a12954883e33e9bbce02fbc8bfb534c3be33865bba2d9b077af2f614e1217a56576adec1d54bcc92e069391febb53a0f5')
sha512sums_x86_64=('5b83c06a48f8b998fcff3b73e27ddfb84b65ca8814f73419dd86bad94daf23e99163cc13cac0037f6af50356820cde4c6a111bb8c8e639931ca2b227d82bce91')

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
