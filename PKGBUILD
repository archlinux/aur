# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.8-3
pkgname=r-zoo
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='S3 Infrastructure for Regular and Irregular Time Series (Zs Ordered Observations)'
arch=('x86_64')
url='https://cran.r-project.org/package=zoo'
license=('GPL')
depends=('r' )
optdepends=('r-coda' 'r-chron' 'r-daag' 'r-fts' 'r-ggplot2' 'r-mondate' 'r-scales' 'r-strucchange' 'r-timedate' 'r-timeseries' 'r-tis' 'r-tseries' 'r-xts')
source=("https://cran.r-project.org/src/contrib/zoo_"$_cranver".tar.gz")
md5sums=('ea6fdac42e5109700dd502e667407e0a')

build(){
    R CMD INSTALL zoo_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -d "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership zoo "$pkgdir"/usr/lib/R/library
}

