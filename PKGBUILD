# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=godot-beta-bin
pkgver=3.2_rc4
pkgrel=1
pkgdesc="The latest official beta release of the Godot game engine"
url="https://godotengine.org"
license=("MIT")
arch=("i686" "x86_64")
provides=("godot-beta-bin")
source=("godot-beta.desktop")
source_i686+=("https://downloads.tuxfamily.org/godotengine/3.2/rc4/Godot_v3.2-rc4_x11.32.zip")
source_x86_64+=("https://downloads.tuxfamily.org/godotengine/3.2/rc4/Godot_v3.2-rc4_x11.64.zip")
sha256sums=('53912a2e312559455045e8e83f6e239a2cbc6f891ebb393f441c772063bb9497')
sha256sums_i686=('fb7670af63bae3056d43941177e9c6b062be643cf73810df0e7b320b54394e9b')
sha256sums_x86_64=('ea6ea4b872038e33f99384250a8c76c203ca126847549bd993ac288ac89512cf')

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  case $CARCH in
    "i686")
      cp "$srcdir/Godot_v3.2-rc4_x11.32" "$pkgdir/opt/$pkgname/godot-beta"
    ;;
    "x86_64")
      cp "$srcdir/Godot_v3.2-rc4_x11.64" "$pkgdir/opt/$pkgname/godot-beta"
    ;;
  esac

  cp "$srcdir/godot-beta.desktop" "$pkgdir/usr/share/applications/godot-beta.desktop"

  chmod +x "$pkgdir/opt/$pkgname/godot-beta"

  ln -s "/opt/$pkgname/godot-beta" "$pkgdir/usr/bin/godot-beta"
}
