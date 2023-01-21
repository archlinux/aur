# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BDMMAcorrect
_pkgver=1.16.2
pkgname=r-${_pkgname,,}
pkgver=1.16.2
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
sha256sums=('fa8f95ac2ac46720f0398c7c60e414165a183427691d01476fa4b2bf9f4fd2bc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
