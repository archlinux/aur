# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=minecraft-legacy-launcher
pkgver=1.6.93.1
pkgrel=3
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
sha256sums=('d98de795667f666652e4d0f453708c51292cc326860f387ae8fdfc7cbaf33ca1'
            'b65cbb23d69037a2b7a7f7eb51bbc2bcf4b207035b1f726b4d8a59f6334cf20d'
            '35c2bcaeb09fa4b8864e9422fd66bf60847706f8b4400ec4a66ba6436b101f71'
            '71b1266dab9d0c3e14f1bb1b040a21d3cb09826b1f17aad444e81ce515f7337f')
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
