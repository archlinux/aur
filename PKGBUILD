# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.0.2
pkgname=r-xmlparsedata
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Parse Data of R Code as an XML Tree'
arch=('any')
url='https://cran.r-project.org/package=xmlparsedata'
license=('MIT')
depends=('r' )
optdepends=('r-covr' 'r-testthat' 'r-xml2')
source=("https://cran.r-project.org/src/contrib/xmlparsedata_"$_cranver".tar.gz")
md5sums=('e33ffa10cbcbc592a6ba683e233e1631')

build(){
    R CMD INSTALL xmlparsedata_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership xmlparsedata "$pkgdir"/usr/lib/R/library
}

