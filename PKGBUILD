# Maintainer: Sterophonick
pkgname=zxadvance
_pkgname='zxadvance'
pkgver=1.0.1
pkgrel=1
pkgdesc='ARM Powered ZX Spectrum emulator for the GBA (tm)'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
source=(https://www.zophar.net/fileuploads/1/267umkwg/ZXAdvance101.zip
        zxadvance
        zxadvance.desktop
        zxadvance.png)
md5sums=('2114f492d4b55d8e13ddde1c777ad905'
         'SKIP'
         'SKIP'
         'SKIP')
options=(!debug !strip)

package() {
  install -Dm755 zxadvance $pkgdir/usr/bin/zxadvance
  install -Dm644 zxadvance.desktop $pkgdir/usr/share/applications/zxadvance.desktop
  install -Dm644 zxadvance.png $pkgdir/usr/share/pixmaps/zxadvance.png

  mkdir -p $pkgdir/usr/share/zxadvance

  cp -r $srcdir/ZXA.INI $pkgdir/usr/share/zxadvance
  cp -r $srcdir/ZXAdvance\ 1.0.1.exe $pkgdir/usr/share/zxadvance
  cp -r $srcdir/readme.txt $pkgdir/usr/share/zxadvance

  chmod -R 777 $pkgdir/usr/share/zxadvance
}
