# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_cranname=finetune
_cranver=1.2.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="The ability to tune models is important. 'finetune' enhances the 'tune' package by providing more specialized methods for finding reasonable values of model tuning parameters."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=(
    r
    r-cli
    r-dials
    r-dplyr
    r-ggplot2
    r-parsnip
    r-purrr
    r-tibble
    r-tidyr
    r-tidyselect
    r-vctrs
    r-workflows
)
makedepends=()
optdepends=(
    r-covr
    r-discrim
    r-kknn
    r-klar
    r-lme4
    r-modeldata
    r-ranger
    r-recipes
    r-rpart
    r-rsample
    r-spelling
    r-testthat
    r-yardstick
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('81ac2a446f16d72e885d6d0fde93c9f4c43a42a18d65697287f3a3cd45c76c1f')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
