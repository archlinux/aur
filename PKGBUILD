# Maintainer: Sterophonick
pkgname=pocketnes
_pkgname='pocketnes'
pkgver=1.2a
pkgrel=1
pkgdesc='PocketNES ROM Builder'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
source=(https://www.dwedit.org/gba/pocketnes_2013_07_01.zip
        pocketnes
        pocketnes.desktop
        pocketnes.png)
md5sums=('2bc7fbfaf80eeadfc5b6145d370db800'
         'SKIP'
         'SKIP'
         'SKIP')
options=(!debug !strip)

package() {
  install -Dm755 pocketnes $pkgdir/usr/bin/pocketnes
  install -Dm644 pocketnes.desktop $pkgdir/usr/share/applications/pocketnes.desktop
  install -Dm644 pocketnes.png $pkgdir/usr/share/pixmaps/pocketnes.png

  mkdir -p $pkgdir/usr/share/pocketnes

  cp -r $srcdir/apack.exe $pkgdir/usr/share/pocketnes
  cp -r $srcdir/menumaker.txt $pkgdir/usr/share/pocketnes
  cp -r $srcdir/nespack7.exe $pkgdir/usr/share/pocketnes
  cp -r $srcdir/pnesmmw.exe $pkgdir/usr/share/pocketnes
  cp -r $srcdir/pnesmmw.mdb $pkgdir/usr/share/pocketnes
  cp -r $srcdir/pocketnes.gba $pkgdir/usr/share/pocketnes
  chmod -R 777 $pkgdir/usr/share/pocketnes
}
