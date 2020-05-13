# Maintainer: Alberto Fanjul <albertofanjul@gmail.com>
pkgname=pdo-tools-bin
pkgver=0.7
pkgrel=1
pkgdesc="A small program thad reads data from Pepakura PDO format and exports the parts as SVG, pdf or obj"
arch=('i686' 'x86_64')
url="https://satd.sk/pages/pdotools/"
license=('GPL')
makedepends=(wget)
depends=("libharu")
provides=("pdo-tools")
source=("$pkgname::http://satd.sk/pages/pdotools/pdotools_l64gtk.zip"
        "pdotools.png::https://satd.sk/pages/pdotool.png"
        "pdotools.desktop")
md5sums=('70b40a239bdd29feccb1a7cc23d7d1c1'
         '6b68b8326db922259f01e52ae6d534e3'
         '6b71e7f46d75a82d8d168f18082930a0')

package() {
  install -Dt $pkgdir/usr/bin $srcdir/pdotools 
  install -d $pkgdir/usr/lib 
  ln -s /usr/lib/libhpdf.so $pkgdir/usr/lib/libhpdf-2.2.1.so 
  install -d $pkgdir/usr/share/applications 
  install -Dt $pkgdir/usr/share/applications pdotools.desktop 
  install -d $pkgdir/usr/share/icons/hicolor/128x128/apps/
  install -Dt $pkgdir/usr/share/icons/hicolor/128x128/apps/ pdotools.png
}
