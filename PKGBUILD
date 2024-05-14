# Maintainer: Sterophonick
pkgname=goomba-color
_pkgname='goomba-color'
pkgver=2019.05.04
pkgrel=1
pkgdesc='DMG/CGB emulator for Game Boy Advance'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
source=(https://www.dwedit.org/gba/goombacolor_2019_5_4.zip
        goomba-front
        goomba-front.desktop
        goomba-front.png)
md5sums=('be58df7b75858b665e64898daaf6e3d3'
         'SKIP'
         'SKIP'
         'SKIP')
options=(!debug !strip)

package() {
  install -Dm755 goomba-front $pkgdir/usr/bin/goomba-front
  install -Dm644 goomba-front.desktop $pkgdir/usr/share/applications/goomba-front.desktop
  install -Dm644 goomba-front.png $pkgdir/usr/share/pixmaps/goomba-front.png

  mkdir -p $pkgdir/usr/share/goomba-color

  cp -r $srcdir/goombafront.exe $pkgdir/usr/share/goomba-color
  cp -r $srcdir/gbctrim.exe $pkgdir/usr/share/goomba-color
  cp -r $srcdir/goomba.gba $pkgdir/usr/share/goomba-color
  chmod -R 777 $pkgdir/usr/share/goomba-color
}
