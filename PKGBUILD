# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CoGAPS
_pkgver=3.20.0
pkgname=r-${_pkgname,,}
pkgver=3.20.0
pkgrel=1
pkgdesc='Coordinated Gene Activity in Pattern Sets'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-bh
  r-biocparallel
  r-biomart
  r-dplyr
  r-fgsea
  r-forcats
  r-ggplot2
  r-gplots
  r-msigdbr
  r-rcolorbrewer
  r-rcpp
  r-rhdf5
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e8d8bbb80ad8de332c82e6490efe0dae20cdd3a88cb767cb8da5590d8d276cee')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
