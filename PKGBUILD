#Maintainer: mike.cuche <cuche AT gmx DOT com>

pkgname=minecraft-pi
pkgver=0.1.1
pkgrel=3
pkgdesc="Minecraft Pi Edition (for Raspberry Pi devices)"
arch=('armv6h' 'armv7h')
url="https://www.minecraft.net/en-us/edition/pi/"
license=('custom')
depends=('libx11' 'sdl' 'libpng12' 'desktop-file-utils')
options=('!emptydirs' '!strip')
source=('minecraft-pi.sh'
'minecraft-pi.png'
'minecraft-pi.desktop'
'https://www.minecraft.net/content/dam/minecraft/edition-pi/minecraft-pi-0.1.1.tar.gz')
md5sums=('3da8abffae8a84c3f4abb16fd71fd406'
'df6c93c429356fbbc633a12c03ca0089'
'19f3b1646fcc96db01d6ba4712e3c2e5'
'be2b7046f83f8682a8ecd80496c5454b')

package() {
  mkdir -p $pkgdir/opt/minecraft-pi
  cp -r mcpi/* "$pkgdir/opt/minecraft-pi/"
  install -Dm755 minecraft-pi.sh $pkgdir/usr/bin/minecraft-pi
  install -Dm644 minecraft-pi.png $pkgdir/usr/share/pixmaps/minecraft-pi.png
  install -Dm644 minecraft-pi.desktop $pkgdir/usr/share/applications/minecraft-pi.desktop
  mkdir -p $pkgdir/usr/share/doc/minecraft-pi
  mv $pkgdir/opt/minecraft-pi/*.txt $pkgdir/usr/share/doc/minecraft-pi
}

