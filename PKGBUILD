# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BDMMAcorrect
_pkgver=1.18.1
pkgname=r-${_pkgname,,}
pkgver=1.18.1
pkgrel=1
pkgdesc='Meta-analysis for the metagenomic read counts data from different cohorts'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-ellipse
  r-ggplot2
  r-rcpp
  r-rcpparmadillo
  r-rcppeigen
  r-summarizedexperiment
  r-vegan
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('47a2067b8957800f2832957bc698ad26df39b1869db23ca913d37d560b7d9a9e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
