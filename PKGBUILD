# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EnrichedHeatmap
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Making Enriched Heatmaps'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-circlize
  r-complexheatmap
  r-genomicranges
  r-getoptlong
  r-iranges
  r-locfit
  r-matrixstats
  r-rcpp
)
optdepends=(
  r-genefilter
  r-knitr
  r-markdown
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ca9ffcf33a1a2cb79ade193d28485b94bedc3da9ef0f40e597399bf398dce2a2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
