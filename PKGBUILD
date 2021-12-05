# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_cranname=tidyselect
_cranver=1.1.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Select from a Set of Strings"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.2' r-ellipsis 'r-glue>=1.3.0' 'r-purrr>=0.3.2' 'r-rlang>=0.4.6' 'r-vctrs>=0.3.0')
optdepends=(r-covr r-crayon r-dplyr r-knitr r-magrittr r-rmarkdown r-testthat r-tibble r-withr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('18eb6a6746196a81ce19ee6cbf1db0c33f494177b97e2419312ef25a00ae486b')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
