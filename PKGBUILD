# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SpidermiR
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='SpidermiR: An R/Bioconductor package for integrative network analysis with miRNA data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-gdata
  r-ggplot2
  r-gplots
  r-gridextra
  r-httr
  r-igraph
  r-latticeextra
  r-mageckflute
  r-mirnatap
  r-mirnatap.db
  r-org.hs.eg.db
  r-tcgabiolinks
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('50110a5eb8d05168cdcdfc0a5e681d598bf7f777119b7812c9d36e98396b3a6c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
