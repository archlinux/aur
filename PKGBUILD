# Maintainer: Sterophonick
pkgname=msxadvance
_pkgname='msxadvance'
pkgver=0.4
pkgrel=1
pkgdesc='MSXAdvance ROM Builder'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
source=(https://www.zophar.net/fileuploads/2/16423qstzl/MSXAdvance04Bin.zip
        msxadvance
        msxadvance.desktop
        msxadvance.png)
md5sums=('cdaa002e25c1967be341a4008b4b08cd'
         'SKIP'
         'SKIP'
         'SKIP')
options=(!debug !strip)

package() {
  install -Dm755 msxadvance $pkgdir/usr/bin/msxadvance
  install -Dm644 msxadvance.desktop $pkgdir/usr/share/applications/msxadvance.desktop
  install -Dm644 msxadvance.png $pkgdir/usr/share/pixmaps/msxadvance.png

  mkdir -p $pkgdir/usr/share/msxadvance

  cp -r $srcdir/Formats.txt $pkgdir/usr/share/msxadvance
  cp -r $srcdir/MSXAdvance.exe $pkgdir/usr/share/msxadvance
  cp -r $srcdir/gamelist.txt $pkgdir/usr/share/msxadvance
  cp -r $srcdir/history.txt $pkgdir/usr/share/msxadvance
  cp -r $srcdir/readme.txt $pkgdir/usr/share/msxadvance
  cp -r $srcdir/msxadva.gba $pkgdir/usr/share/msxadvance
  cp -r $srcdir/msxsplash.raw $pkgdir/usr/share/msxadvance

  chmod -R 777 $pkgdir/usr/share/msxadvance
}
