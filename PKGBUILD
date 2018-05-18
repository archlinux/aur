# Maintainer: Adrien Jussak <jussak.adrien@gmail.com>
# Maintainer: Shoghi Cervantes <shoghi@mojang.com>
# Maintainer: Thomas Guimbretiere <profmobius@mojang.com>
pkgname=minecraft-launcher
pkgver=2.0.1009
pkgrel=3
pkgdesc="Official Minecraft Launcher"
arch=('x86_64')
url="https://mojang.com/"
license=('All rights reserved')
depends=('java-runtime=8' 'icu57' 'xorg-xrandr' 'libxss' 'alsa-lib' 'gtk2' 'gconf' 'libxtst' 'nss')
source=(
https://launcher.mojang.com/mc-staging/download/Minecraft_staging.tar.gz
minecraft-launcher.desktop
minecraft-launcher.svg
)
sha256sums=(
'037a89a5776a508d43e7c5d20c503dbb92f62a490be4c2827018fa18cc90e9c3'
'e1029b0a36cef916c58262e6b41b75defd83327ec41e5b372f9861d663007857'
'35c2bcaeb09fa4b8864e9422fd66bf60847706f8b4400ec4a66ba6436b101f71'
)

build() {

  cd "$srcdir/$pkgname-$pkgver"

}

package () {

  cd "$pkgdir"

  mkdir -p "opt"
  mkdir -p "usr/bin"

  install -Dm644 "$srcdir/minecraft-launcher.svg"    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/minecraft-launcher.svg"

   install -Dm644 "$srcdir/minecraft-launcher.desktop"    "$pkgdir/usr/share/applications/minecraft-launcher.desktop"

  cp -Rv "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
  ln -s "/opt/$pkgname/minecraft-launcher.sh" "$pkgdir/usr/bin/minecraft-launcher"

}
