# Maintainer: Sterophonick
pkgname=wii-scrubber-bin
_pkgname='wii-scrubber-bin'
pkgver=1.4.0
pkgrel=1
pkgdesc='Utilities for editing and extracting Nintendo Wii partitions and WADs'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
source=(wiiscrubber.7z
        makekeybin
        makekeybin.desktop
        makekeybin.png
        partitionbuilder
        partitionbuilder.desktop
        partitionbuilder.png
        wii-scrubber
        wii-scrubber.desktop
        wii-scrubber.png
        wiipartitionbinchanger
        wiipartitionbinchanger.desktop
        wiipartitionbinchanger.png)
md5sums=('5836c45974bed2b87e73a241b8ed6a31'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
options=(!debug !strip)

prepare() {
  7z x wiiscrubber.7z -o$srcdir -aoa
}


package() {
  mkdir -p $pkgdir/usr/share/wii-scrubber
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps

  cp -r $srcdir/* $pkgdir/usr/share/wii-scrubber
  cp $srcdir/makekeybin $pkgdir/usr/bin
  cp $srcdir/partitionbuilder $pkgdir/usr/bin
  cp $srcdir/wii-scrubber $pkgdir/usr/bin
  cp $srcdir/wiipartitionbinchanger $pkgdir/usr/bin

  cp $srcdir/*.png $pkgdir/usr/share/pixmaps
  cp $srcdir/*.desktop $pkgdir/usr/share/applications

  chmod -R 777 $pkgdir/usr/share/wii-scrubber
}
