# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_cranname=glue
_cranver=1.4.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Interpreted String Literals"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.1')
makedepends=(gcc)
optdepends=(r-testthat r-covr r-magrittr r-crayon r-knitr r-rmarkdown r-dbi r-rsqlite r-r.utils r-forcats r-microbenchmark r-rprintf r-stringr r-ggplot2 r-dplyr r-withr r-vctrs)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('6e02313088fb91500b9d9c9bfa0d46ba')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
