# Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=haven
_cranver=2.1.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-haven
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Import and Export SPSS, Stata and SAS Files"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT' 'custom')
depends=('r>=3.2' 'r-forcats>=0.2.0' 'r-hms' 'r-rcpp>=0.11.4' 'r-readr>=0.1.0' 'r-tibble')
makedepends=('make')
optdepends=('r-covr' 'r-fs' 'r-knitr' 'r-rmarkdown' 'r-testthat' 'r-pillar>=1.1.1' 'r-cli' 'r-crayon')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('f1883920a72fb564853f8dd7e1a5bf7c')

build(){
    R CMD INSTALL "${_pkgtar}" -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir"/usr/lib/R/library
}
