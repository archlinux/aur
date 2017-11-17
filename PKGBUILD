# Maintainer: Koyu Berteon <me@koyu.space>
pkgname=minecraft-launcher-tar
pkgver=2.0.1005.1
pkgrel=2
pkgdesc="Updated Minecraft Launcher built with tar file"
arch=('x86_64')
url="https://koyu.space/"
license=('All rights reserved')
depends=('java-runtime=8' 'icu57' 'xorg-xrandr')
source=(
https://launcher.mojang.com/mc-staging/download/Minecraft_staging.tar.gz
minecraft-launcher.desktop
minecraft-launcher.svg
)
sha256sums=(
'bc90bf66f12dbdfb19ae99ad5f9fb16e8bdce204d8cefcf4e17b3bb5a4b454ff'
'e1029b0a36cef916c58262e6b41b75defd83327ec41e5b372f9861d663007857'
'35c2bcaeb09fa4b8864e9422fd66bf60847706f8b4400ec4a66ba6436b101f71'
)

build() {

  cd "$srcdir/minecraft-launcher-2.0.1005"

}

package ()

{

  cd "$pkgdir"

  mkdir -p "opt"
  mkdir -p "usr/bin"

  install -Dm644 "$srcdir/minecraft-launcher.svg"    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/minecraft-launcher.svg"

   install -Dm644 "$srcdir/minecraft-launcher.desktop"    "$pkgdir/usr/share/applications/minecraft-launcher.desktop"

  cp -Rv "$srcdir/minecraft-launcher-2.0.1005" "$pkgdir/opt/$pkgname"
  ln -s "/opt/$pkgname/minecraft-launcher.sh" "$pkgdir/usr/bin/minecraft-launcher"

}
