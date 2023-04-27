# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epistack
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Heatmaps of Stack Profiles from Epigenetic Signals'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-genomicranges
  r-iranges
  r-plotrix
  r-s4vectors
  r-viridislite
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-biomart
  r-covr
  r-enrichedheatmap
  r-knitr
  r-magick
  r-rmarkdown
  r-rtracklayer
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5bddc8ce095744915f6309ca8a3212d6a22feae8e429663f42ce5853ed3ecce6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
