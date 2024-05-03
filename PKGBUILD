# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PDATK
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Pancreatic Ductal Adenocarcinoma Tool-Kit'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-caret
  r-clusterrepro
  r-consensusclusterplus
  r-coregx
  r-data.table
  r-dplyr
  r-genefu
  r-ggplot2
  r-ggplotify
  r-igraph
  r-matrixgenerics
  r-matrixstats
  r-multiassayexperiment
  r-piano
  r-plyr
  r-proc
  r-rcolorbrewer
  r-reportroc
  r-rlang
  r-s4vectors
  r-scales
  r-summarizedexperiment
  r-survcomp
  r-survminer
  r-switchbox
  r-verification
)
optdepends=(
  r-biocstyle
  r-hdf5array
  r-knitr
  r-msigdbr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('db8e024f2e8380df0b4de1eba14d96b53d2d84d8f86b70c12a19a49a206f2f1d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
