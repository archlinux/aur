# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=1.8-4
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
md5sums=('fdd2bbb9c1a737e38c7062ff84506509')

build(){
    R CMD INSTALL zoo_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership zoo "$pkgdir"/usr/lib/R/library
}

