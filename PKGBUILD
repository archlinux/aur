# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coseq
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Co-Expression Analysis of Sequencing Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-capushe
  r-compositions
  r-corrplot
  r-deseq2
  r-e1071
  r-edger
  r-ggplot2
  r-htscluster
  r-htsfilter
  r-mvtnorm
  r-rmixmod
  r-s4vectors
  r-scales
  r-summarizedexperiment
)
optdepends=(
  r-biobase
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c5679607b6cbdfeab0010145f81ff546074e339823c9f5e2901697b0f8c0443c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
