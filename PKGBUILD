# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coseq
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('a83d149e511b5aa3303cd49e5eb37175862828e5c0a376db1facbfe9ff0205b9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
