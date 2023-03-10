# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ENmix
_pkgver=1.34.02
pkgname=r-${_pkgname,,}
pkgver=1.34.02
pkgrel=1
pkgdesc='Quality control and analysis tools for Illumina DNA methylation BeadChip'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationhub
  r-biobase
  r-doparallel
  r-dynamictreecut
  r-experimenthub
  r-foreach
  r-genefilter
  r-geneplotter
  r-gplots
  r-gtools
  r-illuminaio
  r-impute
  r-iranges
  r-matrixstats
  r-minfi
  r-preprocesscore
  r-quadprog
  r-rpmm
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-minfidata
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8e5d322b4105c9f0fae98a0a2444b86f5e97f93ae2d836fcf7cd75ed7a20c566')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
