# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_cranname=dplyr
_cranver=0.8.5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Grammar of Data Manipulation"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.2.0' r-ellipsis 'r-assertthat>=0.2.0' 'r-glue>=1.3.0' 'r-magrittr>=1.5' r-pkgconfig r-r6 'r-rcpp>=1.0.1' 'r-rlang>=0.4.0' 'r-tibble>=2.0.0' 'r-tidyselect>=0.2.5' r-bh 'r-plogr>=0.2.0')
makedepends=(gcc)
optdepends=(r-bit64 r-callr r-covr r-crayon r-dbi r-dbplyr r-dtplyr r-ggplot2 r-hms r-knitr r-lahman r-lubridate r-mgcv r-microbenchmark r-nycflights13 r-rmarkdown r-rmysql r-rpostgresql r-rsqlite r-testthat r-withr r-broom r-purrr r-readr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('86faa442ad8027b27b3ece36a09e7a8b')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
