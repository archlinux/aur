# Maintainer: QuantMint <qua/nt/mint/@/tuta/nota.de>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
pkgname=godot-beta-bin
pkgver=3.2.3_rc5
_v1=3.2.3
_v2=rc5
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
sha512sums_i686=('5bb9b68a1fce65a5dc4f0ff9aa897fcca1a0b5a3e5650d03ae19d8d22959c437b79906e8c3e2a1e9d2abba43beff047c917affec0c2d25168c66fe46fb9b82ef')
sha512sums_x86_64=('360c93e76ec2f58b7fbe768b978fc94aecf71b716c370e174fc6098f4f43ac3d92fcaaa2b7687f4aaf5c527e7a39c91c9d1d90d39793c854322f18cf7135dbbf')

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
