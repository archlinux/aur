# Maintainer: getzze <getzze@gmail.com>
_cranver=0.4-3
pkgname=r-geos
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Interface to Geometry Engine - Open Source (GEOS) using the C-API for topology operations on geometries.'
arch=('x86_64')
url='https://cran.r-project.org/package=rgeos'
license=('GPL')
depends=('r' 'r-cli' 'geos')
source=("https://cran.r-project.org/src/contrib/rgeos_"$_cranver".tar.gz")
sha256sums=('1e86ec8afc157f2d0d4fa61213b63667aef22a4527f30cbd6d6ccf89780de0a7')

build(){
    R CMD INSTALL rgeos_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership rgeos "$pkgdir"/usr/lib/R/library
}

