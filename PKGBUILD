# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EGSEA
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Ensemble of Gene Set Enrichment Analyses'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-dt
  r-edger
  r-egseadata
  r-gage
  r-ggplot2
  r-globaltest
  r-gplots
  r-gsva
  r-htmlutils
  r-htmlwidgets
  r-hwriter
  r-limma
  r-metap
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.rn.eg.db
  r-padog
  r-pathview
  r-plotly
  r-rcolorbrewer
  r-safe
  r-stringi
  r-topgo
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1fd495d230a1114e98b5ed8c257eb34fd2b71dd847c704ff164a15572d6a1101')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
