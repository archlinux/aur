# Maintainer: Sterophonick

pkgname=gba-graphics-editor
_pkgname='gba-graphics-editor'
pkgver=v2.3
pkgrel=1
pkgdesc='Scan compressed and uncompress graphics from GBA ROMs.'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
source=(https://www.hackromtools.info/downloads/gba/HackRomTools%20-%20GBAGraphicsEditor.7z
        gba-graphics-editor
        gba-graphics-editor.desktop
        gba-graphics-editor.png)
md5sums=('100653275bbf916531a0b206f9eb33d6'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
  7z x "HackRomTools%20-%20GBAGraphicsEditor.7z" -o$srcdir -pHackRomTools
}

package() {
  cd $srcdir
  install -Dm755 gba-graphics-editor $pkgdir/usr/bin/gba-graphics-editor
  install -Dm644 gba-graphics-editor.desktop $pkgdir/usr/share/applications/gba-graphics-editor.desktop
  install -Dm644 gba-graphics-editor.png $pkgdir/usr/share/pixmaps/gba-graphics-editor.png
  
  mkdir -p $pkgdir/usr/share/gba-graphics-editor

  install -Dm644 "HackRomTools - GBA Graphics Editor"/* $pkgdir/usr/share/gba-graphics-editor
}
