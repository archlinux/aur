# Maintainer: Sterophonick
# Fork of Difarem's 0CC-FamiTacker package
pkgname=usenti
_pkgname='usenti'
pkgver=1.7.10
pkgrel=2
pkgdesc='Paletted bitmap editor for GBA and NDS development'
url='https://www.coranac.com/projects/usenti/'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
makedepends=(p7zip)
_filename=usenti-1.7.10
source=(https://www.coranac.com/files/usenti/usenti-1.7.10.zip
        usenti
        usenti.desktop
        usenti.png)
noextract=($filename.zip)
md5sums=('44e3497aff83af18db38f61d87611b94'
         'SKIP'
         'SKIP'
         'b2734ff60cb14379c53c900c696c5d78')
license=('MIT')

prepare() {
  7z x $_filename.zip -o$srcdir/$_filename
}

package() {
  cd $srcdir
  install -Dm755 usenti $pkgdir/usr/bin/usenti
  install -Dm644 usenti.desktop $pkgdir/usr/share/applications/usenti.desktop
  install -Dm644 usenti.png $pkgdir/usr/share/pixmaps/usenti.png
  
  install -Dm644 $_filename/readme.txt $pkgdir/usr/share/doc/usenti/readme.txt
  
  cp -rT $_filename $pkgdir/usr/share/usenti
  find $pkgdir/usr/share/usenti -type d -exec chmod 755 "{}" \;
  find $pkgdir/usr/share/usenti -type f -exec chmod 644 "{}" \;
}
