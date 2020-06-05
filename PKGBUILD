# Maintainer: QuantMint <qua/nt/mint/@/tuta/nota.de>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
pkgname=godot-beta-bin
pkgver=3.2.2_beta4
pkgrel=1
pkgdesc='The latest official beta release of the Godot game engine'
url='https://godotengine.org'
license=('MIT')
arch=('i686' 'x86_64')
provides=('godot-beta-bin')
source=('godot-beta.desktop')
source_i686+=('https://downloads.tuxfamily.org/godotengine/3.2.2/beta4/Godot_v3.2.2-beta4_x11.32.zip')
source_x86_64+=('https://downloads.tuxfamily.org/godotengine/3.2.2/beta4/Godot_v3.2.2-beta4_x11.64.zip')
sha256sums=('53912a2e312559455045e8e83f6e239a2cbc6f891ebb393f441c772063bb9497')
sha512sums_i686=('86decc849cae294e6ffe63ab525f94de71ff3c64a6e0216ebe7e4e6cb2da9f778b63d7fd09d1a2f6d6d84e1535bd30defc834c2a2feada6c087edc90b1ba1cbe')
sha512sums_x86_64=('7cf26cd1d7227800f09494ad2e1c464edb0ea86a2f7098a10ea6c41e4ee8401382ada7618f46a6bac80c90dc26393f4508fd1e874c927e8da30df154bc060b0b')

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
