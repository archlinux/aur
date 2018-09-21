# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=0.93-3
pkgname=r-robustbase
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Basic Robust Statistics'
arch=('x86_64')
url='https://cran.r-project.org/package=robustbase'
license=('GPL')
depends=('r' 'r-deoptimr')
optdepends=('r-robust' 'r-fit.models' 'r-mpv' 'r-xtable' 'r-ggplot2' 'r-ggally' 'r-rcolorbrewer' 'r-reshape2' 'r-sfsmisc' 'r-catdata' 'r-doparallel' 'r-foreach' 'r-skewt')
makedepends=('gcc-fortran')
source=("https://cran.r-project.org/src/contrib/robustbase_"$_cranver".tar.gz")
md5sums=('2c5a42a6d238ad81a1293b85146e8d9e')

build(){
    R CMD INSTALL robustbase_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership robustbase "$pkgdir"/usr/lib/R/library
}

