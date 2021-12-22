# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Matt Frichtl <frichtlm@gmail.com>
# Contributor: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=haven
_cranver=2.4.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Import and Export 'SPSS', 'Stata' and 'SAS' Files"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.2' 'r-forcats>=0.2.0' r-hms 'r-readr>=0.1.0' 'r-rlang>=0.4.0' r-tibble r-tidyselect 'r-vctrs>=0.3.0' r-cpp11)
makedepends=(make)
optdepends=(r-cli r-covr r-crayon r-fs r-knitr r-pillar r-rmarkdown r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('95b70f47e77792bed4312441787299d2e3e27d79a176f0638a37e5301b93295f')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
