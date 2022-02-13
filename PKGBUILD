# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_cranname=glue
_cranver=1.6.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Interpreted String Literals"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.4')
optdepends=(r-covr r-crayon r-dbi r-dplyr r-forcats r-ggplot2 r-knitr r-magrittr r-microbenchmark r-r.utils r-rmarkdown r-rprintf r-rsqlite r-stringr r-testthat r-vctrs r-waldo r-withr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('318c2f9544f1204216009f512793c44d6bbe178ff2012f56fa5ffb5e1da978db')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
