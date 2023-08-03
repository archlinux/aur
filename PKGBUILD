# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=schrute
_cranver=1.0.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="The Entire Transcript from the Office in Tidy Format"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=2.10' 'r-magrittr')
optdepends=('r-dplyr' 'r-ggplot2' 'r-knitr' 'r-rmarkdown' 'r-stats' 'r-testthat>=2.1.0' 'r-tidytext')
source=(https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz)
sha256sums=(4bc7accc9837c9df9355a0e5c7378e994956fe2bc0f9035f26957cf186f9b292)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
