# Maintainer: QuantMint <qua/nt/mint/@/tuta/nota.de>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
pkgname=godot-beta-bin
pkgver=3.2.3_beta1
pkgrel=1
pkgdesc='The latest official beta release of the Godot game engine'
url='https://godotengine.org'
license=('MIT')
arch=('i686' 'x86_64')
provides=('godot-beta-bin')
source=('godot-beta.desktop')
source_i686+=('https://downloads.tuxfamily.org/godotengine/3.2.3/beta1/Godot_v3.2.3-beta1_x11.32.zip')
source_x86_64+=('https://downloads.tuxfamily.org/godotengine/3.2.3/beta1/Godot_v3.2.3-beta1_x11.64.zip')
sha256sums=('53912a2e312559455045e8e83f6e239a2cbc6f891ebb393f441c772063bb9497')
sha512sums_i686=('483060313dc4098360db1bef38e45c10a48766b9a4a881a6217fe5ddf063182a158d0e424ac88ab84d02e5a2a3cab2427695aabf93e213a9ca4b42d1fe6006bd')
sha512sums_x86_64=('63de7e2798104d4bd82d0e53755c9c8169a53807f5dba9ead091509d0797808f476968b399e390db91f19e632e2622781a79957e887e378bd0f7b885dfc44817')

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
