# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scDD
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
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
sha256sums=('bf88d50ba6026b48d9194c7ba64b64a951bb4acd54a3d0ddec00f8b6d80fabd9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
