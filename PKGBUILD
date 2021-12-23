# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=rex
_cranver=1.2.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Friendly Regular Expressions"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(r r-lazyeval)
optdepends=(r-covr r-dplyr r-ggplot2 r-hmisc r-knitr r-magrittr r-rmarkdown r-roxygen2 r-rvest r-stringr r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('af42e649c06e4bbdba94d5a1870a7e8347903571c90cd5e5ca40f52307a3bfd6')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
