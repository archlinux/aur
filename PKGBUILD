# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneNetworkBuilder
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
pkgrel=1
pkgdesc='GeneNetworkBuilder: a bioconductor package for building regulatory network using ChIP-chip/ChIP-seq data and Gene Expression Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-graph
  r-htmlwidgets
  r-plyr
  r-rcpp
  r-rcy3
  r-rgraphviz
  r-rjson
  r-xml
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-magick
  r-org.hs.eg.db
  r-rbgl
  r-rmarkdown
  r-runit
  r-shiny
  r-simpintlists
  r-stringdb
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('782f8feee414fc5ea218e3306c9a13c8652d2a6b2cf92bd45b700dda7bde3df6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
