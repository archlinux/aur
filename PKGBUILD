# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.5-9
pkgname=r-magic
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Create and Investigate Magic Squares'
arch=('any')
url='https://cran.r-project.org/package=magic'
license=('GPL2')
depends=('r' 'r-abind')
source=("https://cran.r-project.org/src/contrib/magic_"$_cranver".tar.gz")
md5sums=('646462b59a5118860f2109685ca84509')

build(){
    R CMD INSTALL magic_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership magic "$pkgdir"/usr/lib/R/library
}

