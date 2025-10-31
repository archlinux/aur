# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ComplexHeatmap
_pkgver=2.26.0
pkgname=r-${_pkgname,,}
pkgver=2.26.0
pkgrel=1
pkgdesc='Make Complex Heatmaps'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-circlize
  r-clue
  r-colorspace
  r-digest
  r-doparallel
  r-foreach
  r-getoptlong
  r-globaloptions
  r-iranges
  r-matrixstats
  r-png
  r-rcolorbrewer
)
optdepends=(
  r-cairo
  r-dendextend
  r-dendsort
  r-enrichedheatmap
  r-fastcluster
  r-genomicranges
  r-glue
  r-gplots
  r-gridgraphics
  r-gridtext
  r-grimport
  r-grimport2
  r-jpeg
  r-knitr
  r-magick
  r-markdown
  r-pheatmap
  r-rmarkdown
  r-testthat
  r-tiff
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c8e8a1a06c982b5f23990ae91e8d77e5f657918626cd0b2a043937d0018477c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
