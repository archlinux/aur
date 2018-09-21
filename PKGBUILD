# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=3.2.0
pkgname=r-covr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Test Coverage for Packages'
arch=('x86_64')
url='https://cran.r-project.org/package=covr'
license=('GPL3')
depends=('r' 'r-digest' 'r-jsonlite' 'r-rex' 'r-httr' 'r-crayon' 'r-withr>=1.0.2')
optdepends=('r-r6' 'r-knitr' 'r-rmarkdown' 'r-htmltools' 'r-dt' 'r-testthat' 'r-rstudioapi' 'r-xml2' 'r-memoise' 'r-mockery')
source=("https://cran.r-project.org/src/contrib/covr_"$_cranver".tar.gz")
md5sums=('b34429ae68b0caee13a562ab47537b43')

build(){
    R CMD INSTALL covr_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership covr "$pkgdir"/usr/lib/R/library
}

