# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NBAMSeq
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Negative Binomial Additive Model for RNA-Seq Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-deseq2
  r-genefilter
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b7b3dd203357062d32b2d9a4b85f367e2fd86a0553815adea493b87c67dda331')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
