# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.11-1
pkgname=r-xts
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='eXtensible Time Series'
arch=('x86_64')
url='https://cran.r-project.org/package=xts'
license=('GPL')
depends=('r' 'r-zoo>=1.7.12')
optdepends=('r-timeseries' 'r-timedate' 'r-tseries' 'r-chron' 'r-fts' 'r-tis' 'r-runit')
source=("https://cran.r-project.org/src/contrib/xts_"$_cranver".tar.gz")
md5sums=('949819b03bafd389cf7ed6e3ae59fec6')

build(){
    R CMD INSTALL xts_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership xts "$pkgdir"/usr/lib/R/library
}

