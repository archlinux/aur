# Maintainer: Petr Mrázek <petr@mojang.com>
pkgname=minecraft-launcher-beta
pkgver=2.1.2033
pkgrel=1
pkgdesc="Official Minecraft Launcher - Beta"
arch=('x86_64')
url="https://mojang.com/"
license=('All rights reserved')
depends=('java-runtime=8' 'xorg-xrandr' 'libxss' 'alsa-lib' 'gtk2' 'gconf' 'libxtst' 'nss')
optdepends=('flite: narrator support')
source=(
https://launcher.mojang.com/download/linux/x86_64/minecraft-launcher_${pkgver}-beta.tar.gz
minecraft-launcher-beta.desktop
minecraft-launcher-beta.svg
)
sha256sums=(
'3ca0ab5e1a2b181e753f0b4c0758495bae1a5f88b6f667572193a7e56a02fde8'
'9a00dc84bf9c14e0ccc29cd92882197854a3bd732e64d93a92b0330726ec4960'
'35c2bcaeb09fa4b8864e9422fd66bf60847706f8b4400ec4a66ba6436b101f71'
)

build() {

  cd "$srcdir/minecraft-launcher"

}

package () {

  cd "$pkgdir"

  mkdir -p "opt"
  mkdir -p "usr/bin"

  install -Dm644 "$srcdir/minecraft-launcher-beta.svg"    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/minecraft-launcher-beta.svg"

  install -Dm644 "$srcdir/minecraft-launcher-beta.desktop"    "$pkgdir/usr/share/applications/minecraft-launcher-beta.desktop"

  cp -Rv "$srcdir/minecraft-launcher" "$pkgdir/opt/$pkgname"
  ln -s "/opt/$pkgname/minecraft-launcher" "$pkgdir/usr/bin/$pkgname"

}
