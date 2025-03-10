# Maintainer: Sterophonick
pkgname=god2iso
_pkgname='god2iso'
pkgver=v1.0.5
pkgrel=1
pkgdesc='Convert Xbox 360 Games-on-Demand files into ISO images'
url='https://github.com/raburton/god2iso/'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
makedepends=(p7zip)
source=(https://github.com/raburton/god2iso/releases/download/v1.0.5/God2Iso_v1.0.5_windows.zip
        god2iso
        god2iso.desktop
        god2iso.png)
md5sums=('41cbca2ebcf92583778958443ce05cc1'
         'SKIP'
         'SKIP'
         'SKIP')
license=('CCA4')

package() {
  install -Dm755 god2iso $pkgdir/usr/bin/god2iso
  install -Dm644 god2iso.desktop $pkgdir/usr/share/applications/god2iso.desktop
  install -Dm644 god2iso.png $pkgdir/usr/share/pixmaps/god2iso.png
  
  mkdir -p $pkgdir/usr/share/god2iso

  cp -r $srcdir/God2Iso.exe $pkgdir/usr/share/god2iso
  cp -r $srcdir/Microsoft.WindowsAPICodePack.Shell.dll $pkgdir/usr/share/god2iso
  cp -r $srcdir/Microsoft.WindowsAPICodePack.dll $pkgdir/usr/share/god2iso
}
