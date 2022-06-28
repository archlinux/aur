# Maintainer: <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=rlang
_cranver=1.0.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Functions for Base Types and Core R and 'Tidyverse' Features"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=("r>=3.4.0")
optdepends=(r-cli r-covr r-crayon r-fs r-glue r-knitr r-magrittr r-pillar r-rmarkdown r-testthat r-tibble r-usethis r-vctrs r-withr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("04cc48b1a92dcd531c8e54288119f6dbecc7698928f7aaca840214ae815e0e3e")

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

