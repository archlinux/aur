# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coseq
_pkgver=1.32.1
pkgname=r-${_pkgname,,}
pkgver=1.32.1
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
sha256sums=('0d33f5cd77043055172661838a9f81ac9aedcb8383faa8cfabbd3d70e9bf89a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
