# Maintainer: 0x15 <executeSQUID@gmail.com>

pkgname=olauncher
pkgver=v1.7.3_03
pkgrel=1
pkgdesc="A modified version of the old Minecraft Launcher supporting Microsoft authentication and more"
arch=('any')
url="https://github.com/olauncher/olauncher"
license=('custom')
depends=('glibc' 'libx11' 'freetype2' 'glib2' 'java-runtime' 'opengl-driver')
optdepends=('flite: narrator support')
source=(
https://github.com/olauncher/olauncher/releases/download/v1.7.3_03/olauncher-1.7.3_03-redist.jar
olauncher.desktop
https://launcher.mojang.com/download/minecraft-launcher.svg
olauncher
)
conflicts=()
sha256sums=('6de83fc11450a5fbfe189774063c82a97d946456cf5cfcff46d52352aedce5fc'
            'b6207c4b02733a3d8d2f7efbd3c59afab3292703b06e460eb93258c2d1d95240'
            '35c2bcaeb09fa4b8864e9422fd66bf60847706f8b4400ec4a66ba6436b101f71'
            '682d69dd417f3492de392d259f6a968bd9bdd0f5fa8bea64d69eeed6f25d8733')
package() {
  cd "$pkgdir"

  mkdir -p "$pkgdir/usr"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/java/olauncher"

  install -Dm644 "$srcdir/olauncher-1.7.3_03-redist.jar" "$pkgdir/usr/share/java/olauncher/olauncher-1.7.3_03-redist.jar"
  install -Dm644 "$srcdir/minecraft-launcher.svg"    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/minecraft-launcher.svg"
  install -Dm644 "$srcdir/olauncher.desktop"    "$pkgdir/usr/share/applications/olauncher.desktop"
  install "$srcdir/olauncher"   "$pkgdir/usr/bin/olauncher"
}
