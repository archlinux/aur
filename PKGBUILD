# Maintainer: QuantMint <qua/nt/mint/@/tuta/nota.de>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
pkgname=godot-beta-bin
pkgver=3.2.3_rc3
_v1=3.2.3
_v2=rc3
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
sha512sums_i686=('b668b54e5253d9ed989c45d31c980f638a2b7c882395387dbbc37835532b723674c85708f211f3e101b39938424e7a4c8b3160b589fa463464cfc81f35eeac6e')
sha512sums_x86_64=('9122109bb498e59325b0e57d4786cd89038eb91a367a0617055b72863557c70836b8d56e92db5f61519fe45f114cf1d34150b99cf6cb50ad5576c93608f8e9af')

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
