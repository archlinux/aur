# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TimeSeriesExperiment
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=1.13.0
pkgrel=4
pkgdesc='Analysis for short time-series data'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('MIT')
depends=(
  r
  r-deseq2
  r-dplyr
  r-dynamictreecut
  r-edger
  r-ggplot2
  r-hmisc
  r-limma
  r-magrittr
  r-proxy
  r-s4vectors
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-vegan
  r-viridis
)
optdepends=(
  r-biobase
  r-biocfilecache
  r-circlize
  r-complexheatmap
  r-go.db
  r-grdevices
  r-grid
  r-knitr
  r-mass
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rcolorbrewer
  r-rmarkdown
  r-upsetr
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4cb8c6dedf67dc4571f7e4760f05df83b8348508dd2d85457a0da77172efb72d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
