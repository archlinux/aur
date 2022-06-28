# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioNetStat
_pkgver=1.16.1
pkgname=r-${_pkgname,,}
pkgver=1.16.1
pkgrel=1
pkgdesc='Biological Network Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-dt
  r-ggplot2
  r-hmisc
  r-igraph
  r-knitr
  r-markdown
  r-pathview
  r-pheatmap
  r-plyr
  r-psych
  r-rcolorbrewer
  r-rjsonio
  r-rmarkdown
  r-shiny
  r-shinybs
  r-whisker
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('625db7f20538f023ff2396d029e4d6f048c8c757dfda0ca2d425adbeabbf467f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
