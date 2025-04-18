# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReactomePA
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='Reactome Pathway Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-dose
  r-enrichplot
  r-ggplot2
  r-ggraph
  r-graphite
  r-gson
  r-igraph
  r-reactome.db
)
optdepends=(
  r-biocstyle
  r-clusterprofiler
  r-knitr
  r-org.hs.eg.db
  r-prettydoc
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bd3deee55408b19a46923ffafc132dec5aee4d54a9299cfd2468a979d8b9023e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
