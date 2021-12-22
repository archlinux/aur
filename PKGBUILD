# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Matt Frichtl <frichtlm@gmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=dbplyr
_cranver=2.1.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A 'dplyr' Back End for Databases"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.1' 'r-assertthat>=0.2.0' 'r-blob>=1.2.0' 'r-dbi>=1.0.0' 'r-dplyr>=1.0.4' r-ellipsis 'r-glue>=1.2.0' 'r-lifecycle>=1.0.0' r-magrittr 'r-purrr>=0.2.5' 'r-r6>=2.2.2' 'r-rlang>=0.2.0' 'r-tibble>=1.4.2' 'r-tidyselect>=0.2.4' r-vctrs r-withr)
optdepends=(r-bit64 r-covr r-knitr r-lahman r-nycflights13 r-odbc r-rmariadb r-rmarkdown r-rpostgres r-rpostgresql r-rsqlite r-testthat r-tidyr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('aba4cf47b85ab240fd3ec4cd8d512f6e1958201e151577c1a2ebc3d6ebc5bc08')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
