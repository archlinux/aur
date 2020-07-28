# Maintainer: QuantMint <qua/nt/mint/@/tuta/nota.de>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
pkgname=godot-beta-bin
pkgver=3.2.3_rc2
_v1=3.2.3
_v2=rc2
pkgrel=1
pkgdesc='The latest official beta release of the Godot game engine'
url='https://godotengine.org'
license=('MIT')
arch=('i686' 'x86_64')
provides=('godot-beta-bin')
source=("godot-beta.desktop")
source_i686+=("https://downloads.tuxfamily.org/godotengine/$_v1/$_v2/Godot_v${_v1}-${_v2}_x11.32.zip")
source_x86_64+=("https://downloads.tuxfamily.org/godotengine/$_v1/$_v2/Godot_v${_v1}-${_v2}_x11.64.zip")
sha256sums=('53912a2e312559455045e8e83f6e239a2cbc6f891ebb393f441c772063bb9497')
sha512sums_i686=('e5d21be400cbc79dbc5f207f2cf1a9c4119583f02057d2164fb61aca233d9265a496e4050de7c96149af963bc2c39ea14bebde0bb1a6d49517416e1b355f14a3')
sha512sums_x86_64=('a6b4590ad6337e7bb71d3b236c83d8e7c06af516535d0ad0f473a2f1a56151f80404847cd52bb1c29934cea9c3212dbb756aa6bd950b27ac5222dbd43ff3031b')

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
