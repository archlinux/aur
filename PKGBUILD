# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EnrichedHeatmap
_pkgver=1.28.1
pkgname=r-${_pkgname,,}
pkgver=1.28.1
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
sha256sums=('2c47fe0aaa599194ffe31eec5b4cff1afc7c2c58c55e7305f3966b8743d27b46')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
