# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=abr2gbr
pkgver=1.0.2
pkgrel=2
pkgdesc='Converts PhotoShop .ABR and Paint Shop Pro .JBR brushes to GIMP .GBR. '
arch=('i686' 'x86_64')
url='https://the.sunnyspot.org/gimp/tools.html'
license=('GPL')
depends=(glib)
makedepends=(glib)
source=("$pkgname-$pkgver.tar.gz::https://the.sunnyspot.org/gimp/tools/abr2gbr-$pkgver.tgz")
sha256sums=('cbfeb8726b08490146bc982a87aa228de271e8fdfa4a013f3705ce3135dafd68')

build(){
  cd "$srcdir"/src
  make
}
package(){
  cd "$srcdir"/src
  install -Dm755 .obj/abr2gbr "$pkgdir"/usr/bin/abr2gbr
  ln -s abr2gbr "$pkgdir"/usr/bin/jbr2gbr
}
