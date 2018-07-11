# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.9.5
pkgname=r-startupmsg
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Utilities for Start-Up Messages'
arch=('any')
url='https://cran.r-project.org/package=startupmsg'
license=('LGPL3')
depends=('r' )
replaces=('r-cran-startupmsg')
source=("https://cran.r-project.org/src/contrib/startupmsg_"$_cranver".tar.gz")
md5sums=('4386dd50612aea6ccaca1a4de95c5383')

build(){
    R CMD INSTALL startupmsg_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -d "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership startupmsg "$pkgdir"/usr/lib/R/library
}

