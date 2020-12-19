# Maintainer: Evan Oicle <oicleevan@protonmail.com>
# Contributor: Petr Mrázek <petr@mojang.com>
pkgname=minecraft-launcher-arch
pkgver=2.2.909
pkgrel=1
pkgdesc="Minecraft Launcher -- Quicker Updates"
arch=('x86_64')
url="https://mojang.com/"
license=('All rights reserved')
depends=('java-runtime' 'xorg-xrandr' 'libxss' 'libx11' 'libxcb' 'alsa-lib' 'gtk2' 'gtk3' 'libxtst' 'nss')
optdepends=('flite: narrator support')
conflicts=('minecraft-launcher' 'minecraft-launcher-beta')
provides=('minecraft-launcher' 'minecraft-launcher-beta')
source=(
https://launcher.mojang.com/download/Minecraft.tar.gz
minecraft-launcher.desktop
https://launcher.mojang.com/download/minecraft-launcher.svg
)
sha256sums=(
'02e6067790bb65b2f0229ae297806bbdc77d1d1934f8a49d5ca21286728da297'
'677e2442a1ae83cc58d8d403666e508129e97dbed37fdfafdceac6101dc0dee7'
'35c2bcaeb09fa4b8864e9422fd66bf60847706f8b4400ec4a66ba6436b101f71'
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

  cp -Rv "$srcdir/minecraft-launcher" "$pkgdir/opt/$pkgname"
  ln -s "/opt/$pkgname/minecraft-launcher" "$pkgdir/usr/bin/$pkgname"

}
