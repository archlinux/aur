# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=godot-beta-bin
pkgver=3.1_beta8
pkgrel=1
pkgdesc="The latest official beta release of the Godot game engine"
url="https://godotengine.org"
license=("MIT")
arch=("i686" "x86_64")
provides=("godot-beta-bin")
source=("godot-beta.desktop")
source_i686+=("https://downloads.tuxfamily.org/godotengine/3.1/beta8/Godot_v3.1-beta8_x11.32.zip")
source_x86_64+=("https://downloads.tuxfamily.org/godotengine/3.1/beta8/Godot_v3.1-beta8_x11.64.zip")
sha256sums=('53912a2e312559455045e8e83f6e239a2cbc6f891ebb393f441c772063bb9497')
sha256sums_i686=('18ee9c11216dbbaa6573daa710a7687a1556477828f0bbf36de83620ce6a0b2e')
sha256sums_x86_64=('ab5d00a9b99636687fc64e4c32331dc37e217033bbca4683e078e1163988b88c')

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  case $CARCH in
    "i686")
      cp "$srcdir/Godot_v3.1-beta8_x11.32" "$pkgdir/opt/$pkgname/godot-beta"
    ;;
    "x86_64")
      cp "$srcdir/Godot_v3.1-beta8_x11.64" "$pkgdir/opt/$pkgname/godot-beta"
    ;;
  esac

  cp "$srcdir/godot-beta.desktop" "$pkgdir/usr/share/applications/godot-beta.desktop"

  chmod +x "$pkgdir/opt/$pkgname/godot-beta"

  ln -s "/opt/$pkgname/godot-beta" "$pkgdir/usr/bin/godot-beta"
}
