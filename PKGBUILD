# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_cranname=vip
_cranver=0.4.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A general framework for constructing variable importance plots from various types of machine learning models in R."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=(
    r
    r-foreach
    r-ggplot2
    r-stats
    r-tibble
    r-yardstick
)
makedepends=()
optdepends=(
    r-bookdown
    r-covr
    r-dt
    r-doParallel
    r-dplyr
    r-fastshape
    r-knitr
    r-lattice
    r-mlbench
    r-modeldata
    r-pdp
    r-rmarkdown
    r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('5565dd2895e7166199da859b346bd8fe9c4b48b0871fa799065f9132be780759')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
