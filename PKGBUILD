# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.4-13
pkgname=r-quantmod
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Quantitative Financial Modelling Framework'
arch=('any')
url='https://cran.r-project.org/package=quantmod'
license=('GPL3')
depends=('r' 'r-xts>=0.9.0' 'r-zoo' 'r-ttr>=0.2' 'r-curl')
optdepends=('r-dbi' 'r-rmysql' 'r-rsqlite' 'r-timeseries' 'r-xml' 'r-downloader' 'r-jsonlite')
source=("https://cran.r-project.org/src/contrib/quantmod_"$_cranver".tar.gz")
md5sums=('3b9eb2762cc25a461bb981c238f92ef8')

build(){
    R CMD INSTALL quantmod_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership quantmod "$pkgdir"/usr/lib/R/library
}

