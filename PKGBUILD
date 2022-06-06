# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparrow
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
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
sha256sums=('9cbfa3ca99dc8fe4ae140239365a69784ebc99345f3796774b8949dc94c3552b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
