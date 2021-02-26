# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=minecraft-legacy-launcher
pkgver=1.6.93.1
pkgrel=2
pkgdesc="Minecraft Legacy Java Launcher"
arch=(x86_64)
url="https://bugs.mojang.com/browse/MCL-11993"
license=('All rights reserved')
depends=('glibc' 'libx11' 'freetype2' 'glib2' 'java-runtime' 'opengl-driver')
optdepends=('flite: narrator support')
source=(
https://launcher.mojang.com/v1/objects/eabbff5ff8e21250e33670924a0c5e38f47c840b/launcher.jar
minecraft-legacy-launcher.desktop
https://launcher.mojang.com/download/minecraft-launcher.svg
minecraft-legacy-launcher
)
conflicts=(minecraft-launcher)
md5sums=('f2171107e6b1f8a3483c5e3ed5d1229e'
         'cd561eab1fd1fddae58fb8205a00f54f'
         '0b104e3049346908bf559cab602071e3'
         '8e597d8b7aece38a9ee3bb7cf965a31d')
package() {
  cd "$pkgdir"
  mkdir -p "$pkgdir/usr"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/java/myprogram"
  cd "$pkgdir/usr/share/java/myprogram"
  cp "$srcdir/launcher.jar" "launcher.jar"
  install -Dm644 "$srcdir/minecraft-launcher.svg"    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/minecraft-launcher.svg"
  install -Dm644 "$srcdir/minecraft-legacy-launcher.desktop"    "$pkgdir/usr/share/applications/minecraft-legacy-launcher.desktop"
  install "$srcdir/minecraft-legacy-launcher"   "$pkgdir/usr/bin/minecraft-legacy-launcher"  
}
