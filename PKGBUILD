# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Matt Frichtl <frichtlm@gmail.com>
# Contributor: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=haven
_cranver=2.2.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Import and Export 'SPSS', 'Stata' and 'SAS' Files"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.2' 'r-forcats>=0.2.0' r-hms 'r-rcpp>=0.11.4' 'r-readr>=0.1.0' 'r-rlang>=0.4.0' r-tibble r-tidyselect)
makedepends=(gcc)
optdepends=(r-covr r-fs r-knitr r-rmarkdown r-testthat r-pillar r-cli r-crayon)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('822ff6e567fe0cdeda88a5cb2a6e75c5')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
