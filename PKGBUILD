# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowPloidy
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Analyze flow cytometer data to determine sample ploidy'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-car
  r-catools
  r-flowcore
  r-knitr
  r-minpack.lm
  r-rmarkdown
  r-shiny
)
optdepends=(
  r-flowploidydata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6ae528945a5d86ef6dcdd36b9f190171c4f3a333e768e6a6ea03a838f586f919')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
