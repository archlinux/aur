# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=vroom
_cranver=1.5.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Read and Write Rectangular Text Data Quickly"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.1' r-bit64 r-crayon r-cli r-glue r-hms r-lifecycle 'r-rlang>=0.4.2' 'r-tibble>=2.0.0' 'r-tzdb>=0.1.1' 'r-vctrs>=0.2.0' r-tidyselect r-withr 'r-progress>=1.2.1' 'r-cpp11>=0.2.0')
optdepends=(r-archive r-bench r-covr r-curl r-dplyr r-forcats r-fs r-ggplot2 r-knitr r-patchwork r-prettyunits r-purrr r-rmarkdown r-rstudioapi r-scales r-spelling r-testthat r-tidyr r-waldo r-xml2)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('44f92478d4725869cad7fdbb166268aa149ad8f510c378d16047d5b03b4e4b42')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
