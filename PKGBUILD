# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=godot-beta-bin
pkgver=3.1_rc1
pkgrel=1
pkgdesc="The latest official beta release of the Godot game engine"
url="https://godotengine.org"
license=("MIT")
arch=("i686" "x86_64")
provides=("godot-beta-bin")
source=("godot-beta.desktop")
source_i686+=("https://downloads.tuxfamily.org/godotengine/3.1/rc1/Godot_v3.1-rc1_x11.32.zip")
source_x86_64+=("https://downloads.tuxfamily.org/godotengine/3.1/rc1/Godot_v3.1-rc1_x11.64.zip")
sha256sums=('53912a2e312559455045e8e83f6e239a2cbc6f891ebb393f441c772063bb9497')
sha256sums_i686=('c864d20d5dbca4d3654b69b3982ccd0a9eb6e748c909bcbecb3f27e3f52d4c22')
sha256sums_x86_64=('86c6f22ca4aa36591aef9d1b4c8dbb03add9e03c4dffec8216e14638aff9246b')

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  case $CARCH in
    "i686")
      cp "$srcdir/Godot_v3.1-rc1_x11.32" "$pkgdir/opt/$pkgname/godot-beta"
    ;;
    "x86_64")
      cp "$srcdir/Godot_v3.1-rc1_x11.64" "$pkgdir/opt/$pkgname/godot-beta"
    ;;
  esac

  cp "$srcdir/godot-beta.desktop" "$pkgdir/usr/share/applications/godot-beta.desktop"

  chmod +x "$pkgdir/opt/$pkgname/godot-beta"

  ln -s "/opt/$pkgname/godot-beta" "$pkgdir/usr/bin/godot-beta"
}
