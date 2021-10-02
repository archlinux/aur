# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_cranname=tidyr
_cranver=1.1.4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tidy Messy Data"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.1' 'r-dplyr>=0.8.2' 'r-ellipsis>=0.1.0' r-glue r-lifecycle r-magrittr r-purrr r-rlang 'r-tibble>=2.1.1' 'r-tidyselect>=1.1.0' 'r-vctrs>=0.3.6' 'r-cpp11>=0.2.6')
optdepends=(r-covr r-data.table r-jsonlite r-knitr r-repurrrsive r-rmarkdown r-readr r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('0b0c98be98a433e15a2550f60330b31a58529a9c58bc2abd7bff6462ab761241')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
