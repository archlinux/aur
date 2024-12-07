# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_cranname=tidyjson
_cranver=0.3.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Turn complex 'JSON' data into tidy data frames."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=(
    r
    r-assertthat
    r-dplyr
    r-jsonlite
    r-magrittr
    r-purrr
    r-tibble
    r-tidyr
)
makedepends=(gcc)
optdepends=(
    r-covr
    r-forcats
    r-ggplot2
    r-igraph
    r-knitr
    r-listviewer
    r-lubridate
    r-rcolorbrewer
    r-rmarkdown
    r-rprojroot
    r-testthat
    r-vctrs
    r-viridis
    r-wordcloud
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('e636cabc95babe12f0051b57404c2aa49f13b5d54a6904e84770ee3b412ad57e')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
