# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scDD
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Mixture modeling of single-cell RNA-seq data to identify genes with differential distributions'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-arm
  r-biocparallel
  r-ebseq
  r-fields
  r-ggplot2
  r-mclust
  r-outliers
  r-s4vectors
  r-scran
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-gridextra
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cb67843a0269f4cb86854b494e81f91ba33629592b5e2b6a92dd58ea2b57d080')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
