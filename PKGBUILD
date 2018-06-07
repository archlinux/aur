# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=quantmod
_cranver=0.4-13
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-quantmod
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Quantitative Financial Modelling Framework"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-xts' 'r-zoo' 'r-curl')

optdepends=('r-dbi' 'r-timeseries' 'r-xml' 'r-downloader' 'r-jsonlite')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('3b9eb2762cc25a461bb981c238f92ef8')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

