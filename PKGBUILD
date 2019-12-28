# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=godot-beta-bin
pkgver=3.2_beta4
pkgrel=1
pkgdesc="The latest official beta release of the Godot game engine"
url="https://godotengine.org"
license=("MIT")
arch=("i686" "x86_64")
provides=("godot-beta-bin")
source=("godot-beta.desktop")
source_i686+=("https://downloads.tuxfamily.org/godotengine/3.2/beta4/Godot_v3.2-beta4_x11.32.zip")
source_x86_64+=("https://downloads.tuxfamily.org/godotengine/3.2/beta4/Godot_v3.2-beta4_x11.64.zip")
sha256sums=('53912a2e312559455045e8e83f6e239a2cbc6f891ebb393f441c772063bb9497')
sha256sums_i686=('995005b737c72e8dfe9d8862c79cb6f4693f0be5278d66884900e28f8d02126e')
sha256sums_x86_64=('2da821e2a1537304e562ebcc9bc7bf6969490e73049d47711ed0cb9b41c49d23')

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  case $CARCH in
    "i686")
      cp "$srcdir/Godot_v3.2-beta4_x11.32" "$pkgdir/opt/$pkgname/godot-beta"
    ;;
    "x86_64")
      cp "$srcdir/Godot_v3.2-beta4_x11.64" "$pkgdir/opt/$pkgname/godot-beta"
    ;;
  esac

  cp "$srcdir/godot-beta.desktop" "$pkgdir/usr/share/applications/godot-beta.desktop"

  chmod +x "$pkgdir/opt/$pkgname/godot-beta"

  ln -s "/opt/$pkgname/godot-beta" "$pkgdir/usr/bin/godot-beta"
}
