# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=oblong
pkgver=2014.03.10
pkgrel=1
pkgdesc="A program to analyse phylogenomic data sets with millions of characters, requiring negligible amounts of RAM. https://doi.org/10.1111/cla.12056"
arch=(x86_64)
url="http://www.lillo.org.ar/phylogeny/oblong/"
license=('GPL2')
depends=('gcc-libs')
makedepends=('gcc')
source=("http://www.lillo.org.ar/phylogeny/oblong/oblong.zip")
md5sums=('858960b23c1fdfe81834957ef47c4670')

build() {
  gcc -lm -O3 -o $pkgname -DBITS64 $pkgname.c
}

package() {
  chmod +x $pkgname
  install -Dm 755 $pkgname ${pkgdir}/usr/bin/$pkgname
}
