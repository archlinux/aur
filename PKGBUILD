# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=abr2gbr
pkgver=1.0.2
pkgrel=1
pkgdesc='Converts PhotoShop .ABR and Paint Shop Pro .JBR brushes to GIMP .GBR. '
arch=('i686' 'x86_64')
#arch=('any')
url='http://the.sunnyspot.org/gimp/tools.html'
license=('GPL')
depends=(glib)
makedepends=(glib)
source=("$pkgname-$pkgver.tar.gz::http://the.sunnyspot.org/gimp/tools/abr2gbr-$pkgver.tgz")

build(){
  cd "$srcdir"/src
  make
}
package(){
  cd "$srcdir"/src
  install -Dm755 .obj/abr2gbr "$pkgdir"/usr/bin/abr2gbr
  ln -s abr2gbr "$pkgdir"/usr/bin/jbr2gbr
}
md5sums=('edecc74a3df1ce858ec641de9a098cdf')
