# Maintainer: QuantMint <qua/nt/mint/@/tuta/nota.de>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
pkgname=godot-beta-bin
pkgver=3.2.2_rc2
pkgrel=1
pkgdesc='The latest official beta release of the Godot game engine'
url='https://godotengine.org'
license=('MIT')
arch=('i686' 'x86_64')
provides=('godot-beta-bin')
source=('godot-beta.desktop')
source_i686+=('https://downloads.tuxfamily.org/godotengine/3.2.2/rc2/Godot_v3.2.2-rc2_x11.32.zip')
source_x86_64+=('https://downloads.tuxfamily.org/godotengine/3.2.2/rc2/Godot_v3.2.2-rc2_x11.64.zip')
sha256sums=('53912a2e312559455045e8e83f6e239a2cbc6f891ebb393f441c772063bb9497')
sha512sums_i686=('17538f5d7027e918d97c6b60a5206d0ad9b4d5bb2421b70fd6f4be9c28d2c82b3868ecfe3d09f0a6156cddde735095bb8e9f757a45c491c1ab495f062ef02fc6')
sha512sums_x86_64=('ecf80fe453bb15dbf342d9f97138b37d21f451f4d97ea3a9b8e76d51a3ce1349b2de953622f9603f7eaf37785111c767f6db58250c29630fa39e0cbe55a9aeb4')

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
