# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparrow
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Take command of set enrichment analyses through a unified interface'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-babelgene
  r-biocgenerics
  r-biocparallel
  r-biocset
  r-checkmate
  r-circlize
  r-complexheatmap
  r-data.table
  r-delayedmatrixstats
  r-edger
  r-ggplot2
  r-gseabase
  r-irlba
  r-limma
  r-plotly
  r-viridis
)
optdepends=(
  r-annotationdbi
  r-biasedurn
  r-biobase
  r-biocstyle
  r-deseq2
  r-dplyr
  r-dtplyr
  r-fgsea
  r-go.db
  r-goseq
  r-gsva
  r-hexbin
  r-kernsmooth
  r-knitr
  r-magrittr
  r-matrixstats
  r-msigdbr
  r-panther.db
  r-r.utils
  r-reactome.db
  r-rmarkdown
  r-statmod
  r-stringr
  r-summarizedexperiment
  r-testthat
  r-webshot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2d739725dca783e421fb8bb857bec9939898a8e9683919087f1a6f09ad1a1cc6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
