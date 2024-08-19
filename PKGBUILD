# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname='naturaldocs'
pkgver=1.52
pkgrel=1
pkgdesc="An open-source documentation generator for multiple programming languages."
arch=('any')
url="http://www.naturaldocs.org/"
license=('GPL2')
provides=('naturaldocs')
depends=('perl')
source=("http://downloads.sourceforge.net/project/naturaldocs/Stable%20Releases/1.52/NaturalDocs-$pkgver.zip")
noextract=("${source[@]%%::*}")
md5sums=('68e3982acae57b6befdf9e75b420fd80')

package() {
  mkdir -p "$pkgdir/usr/share/naturaldocs/"
  bsdtar -x -f "NaturalDocs-$pkgver.zip" -C "$pkgdir/usr/share/naturaldocs/"
  chmod +x "$pkgdir/usr/share/naturaldocs/NaturalDocs"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/share/naturaldocs/NaturalDocs "$pkgdir/usr/bin/NaturalDocs"
  ln -s /usr/share/naturaldocs/NaturalDocs "$pkgdir/usr/bin/naturaldocs"
  chmod o-w -R "$pkgdir/usr/share/naturaldocs/"
}
