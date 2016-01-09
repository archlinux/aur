#Maintainer: Michele Bovo <mbovo AT gmx DOT com>

pkgname=minecraft-pi
pkgver=0.11
pkgrel=1
pkgdesc="Minecraft Pi Edition (for Raspberry Pi devices)"
arch=('armv6h' 'armv7h')
url="http://pi.minecraft.net/"
license=('custom')
depends=('libx11' 'libpng12' 'desktop-file-utils')
#optdepends=('python-minecraft-pi: Python bindings for Minecraft Pi')
makedepends=('pacman>=4.2.0')
options=('!emptydirs' '!strip')
#install=$pkgname.install
source=('minecraft-pi.sh'
'minecraft-pi.png'
'minecraft-pi.desktop'
'https://s3.amazonaws.com/assets.minecraft.net/pi/minecraft-pi-0.1.1.tar.gz')
md5sums=('3da8abffae8a84c3f4abb16fd71fd406'
'df6c93c429356fbbc633a12c03ca0089'
'19f3b1646fcc96db01d6ba4712e3c2e5'
'd24f5794c0f640823f25ffcb553ce18f')

package() {
  mkdir -p $pkgdir/opt/minecraft-pi
  cp -r mcpi/* "$pkgdir/opt/minecraft-pi/"
  install -Dm755 minecraft-pi.sh $pkgdir/usr/bin/minecraft-pi
  install -Dm644 minecraft-pi.png $pkgdir/usr/share/pixmaps/minecraft-pi.png
  install -Dm644 minecraft-pi.desktop $pkgdir/usr/share/applications/minecraft-pi.desktop
  mkdir -p $pkgdir/usr/share/doc/minecraft-pi
  mv $pkgdir/opt/minecraft-pi/*.txt $pkgdir/usr/share/doc/minecraft-pi
}

