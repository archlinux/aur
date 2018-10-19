# Maintainer: getzze <getzze@gmail.com>
_cranver=0.3-28
pkgname=r-geos
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Interface to Geometry Engine - Open Source (GEOS) using the C-API for topology operations on geometries.'
arch=('x86_64')
url='https://cran.r-project.org/package=rgeos'
license=('GPL')
depends=('r' 'r-cli' 'geos')
source=("https://cran.r-project.org/src/contrib/rgeos_"$_cranver".tar.gz")
sha256sums=('18e068dc68cf4da9f88aa42125edbd54bfce3c23101f994068ef91571cbccbb5')

build(){
    R CMD INSTALL rgeos_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership rgeos "$pkgdir"/usr/lib/R/library
}

