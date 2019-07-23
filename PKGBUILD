# Maintainer: Petr Mrázek <petr@mojang.com>
pkgname=minecraft-launcher-beta
pkgver=2.1.5969
pkgrel=1
pkgdesc="Official Minecraft Launcher Beta"
arch=('x86_64')
url="https://mojang.com/"
license=('All rights reserved')
depends=('java-runtime' 'xorg-xrandr' 'libxss' 'libx11' 'libxcb' 'alsa-lib' 'gtk2' 'gconf' 'libxtst' 'nss')
optdepends=('flite: narrator support')
conflicts=('minecraft-launcher')
source=(
https://launcher.mojang.com/download/linux/x86_64/minecraft-launcher_${pkgver}.tar.gz
minecraft-launcher.desktop
minecraft-launcher.svg
)
sha256sums=(
'3d87662da47b5c7fa25a7fe8a9326d664051d7955999bfdb95d4a7184dcc085b'
'677e2442a1ae83cc58d8d403666e508129e97dbed37fdfafdceac6101dc0dee7'
'58200e6464bdb26d640be0c4c1ac20384a627b46ed912da1844cd8ad32c0a3b8'
)

build() {

  cd "$srcdir/minecraft-launcher"

}

package () {

  cd "$pkgdir"

  mkdir -p "opt"
  mkdir -p "usr/bin"

  install -Dm644 "$srcdir/minecraft-launcher.svg"    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/minecraft-launcher.svg"

  install -Dm644 "$srcdir/minecraft-launcher.desktop"    "$pkgdir/usr/share/applications/minecraft-launcher.desktop"

  cp -Rv "$srcdir/minecraft-launcher" "$pkgdir/opt/minecraft-launcher"
  ln -s "/opt/minecraft-launcher/minecraft-launcher" "$pkgdir/usr/bin/minecraft-launcher"

}
