# Maintainer: Haruo <haruo-mtok [at] outlook [dot] com>

_cranname=tableone
_cranver=0.13.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Create 'Table 1' to Describe Baseline Characteristics with or without Propensity Score Weights"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL-2')
depends=(
    'r-survey'
    'r-e1071'
    'r-zoo'
    'r-gmodels'
    'r-labelled'
)
optdepends=(
    'r-testthat'
    'r-matching'
    'r-reshape2'
    'r-ggplot2'
    'r-knitr'
    'r-geepack'
    'r-lme4'
    'r-lmertest'
    'r-rmarkdown'
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=('bb641f1b951f180942a199877358d3197b90b138adfa7436c55cff615a990e908754bcaeaf4bafe858216b4f110bb0887e978ca398fac1cea4b0b64d620f8fb4')

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
