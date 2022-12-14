# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=butcher
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=0.3.1
pkgrel=1
pkgdesc='Model Butcher'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-cli
  r-lobstr
  r-purrr
  r-rlang
  r-tibble
  r-vctrs
)
optdepends=(
  r-c50
  r-caret
  r-clisymbols
  r-covr
  r-ddalpha
  r-dimred
  r-dplyr
  r-e1071
  r-earth
  r-flexsurv
  r-fs
  r-ipred
  r-kernlab
  r-kknn
  r-knitr
  r-mass
  r-mda
  r-mgcv
  r-modeldata
  r-nnet
  r-parsnip
  r-pkgload
  r-pls
  r-qsardata
  r-randomforest
  r-ranger
  r-rann
  r-recipes
  r-rmarkdown
  r-rpart
  r-rsample
  r-rspectra
  r-survival
  r-testthat
  r-th.data
  r-usethis
  r-xgboost
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fc79bf112538210fe8033ff14a73f1950bbd98ff0046de17291fb983d025bffa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
