# Maintainer: Sterophonick
pkgname=smsadvance
_pkgname='smsadvance'
pkgver=2.5
pkgrel=1
pkgdesc='SMSAdvance ROM Builder'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
source=(https://www.zophar.net/fileuploads/2/16428iussy/SMSAdvance25Bin.zip
        smsadvance
        smsadvance.desktop
        smsadvance.png)
md5sums=('91ece0acb6f5a3b7e83d22904dceccce'
         'SKIP'
         'SKIP'
         'SKIP')
options=(!debug !strip)

package() {
  install -Dm755 smsadvance $pkgdir/usr/bin/smsadvance
  install -Dm644 smsadvance.desktop $pkgdir/usr/share/applications/smsadvance.desktop
  install -Dm644 smsadvance.png $pkgdir/usr/share/pixmaps/smsadvance.png

  mkdir -p $pkgdir/usr/share/smsadvance

  cp -r $srcdir/Formats.txt $pkgdir/usr/share/smsadvance
  cp -r $srcdir/SEGA_GBA.raw $pkgdir/usr/share/smsadvance
  cp -r $srcdir/SMSAdvance.exe $pkgdir/usr/share/smsadvance
  cp -r $srcdir/gamelist.txt $pkgdir/usr/share/smsadvance
  cp -r $srcdir/history.txt $pkgdir/usr/share/smsadvance
  cp -r $srcdir/readme.txt $pkgdir/usr/share/smsadvance
  cp -r $srcdir/segabox.raw $pkgdir/usr/share/smsadvance
  cp -r $srcdir/smsadvance.gba $pkgdir/usr/share/smsadvance
  cp -r $srcdir/smsadvance.mbz $pkgdir/usr/share/smsadvance
  cp -r $srcdir/smsasplash.raw $pkgdir/usr/share/smsadvance

  chmod -R 777 $pkgdir/usr/share/smsadvance
}
