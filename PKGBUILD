# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Matt Frichtl <frichtlm@gmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=dbplyr
_cranver=2.2.0
_updatedate=2022-06-08
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A 'dplyr' Back End for Databases"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.1' 'r-assertthat>=0.2.0' 'r-cli>=3.3.0' 'r-blob>=1.2.0' 'r-dbi>=1.0.0' 'r-dplyr>=1.0.9' 'r-glue>=1.2.0' 'r-lifecycle>=1.0.0' r-magrittr 'r-pillar>=1.5.0' 'r-purrr>=0.2.5' 'r-r6>=2.2.2' 'r-rlang>=1.0.0' 'r-tibble>=1.4.2' 'r-tidyselect>=0.2.4' 'r-vctrs>=0.4.1' r-withr)
optdepends=(r-bit64 r-covr r-knitr r-lahman r-nycflights13 r-odbc r-rmariadb r-rmarkdown r-rpostgres r-rpostgresql r-rsqlite r-testthat r-tidyr)
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('4a6e092c9349f8b3030c752f8c6cc551637d6fbca3c84be0da89968f1e9adce1')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
