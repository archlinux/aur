# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NetSAM
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='Network Seriation And Modularization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-annotationdbi
  r-biomart
  r-dbi
  r-doparallel
  r-foreach
  r-go.db
  r-igraph
  r-r2html
  r-seriation
  r-wgcna
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-markdown
  r-org.at.tair.db
  r-org.ce.eg.db
  r-org.cf.eg.db
  r-org.dm.eg.db
  r-org.dr.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.rn.eg.db
  r-org.sc.sgd.db
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6b1bc71555371d512a3af577978f5e405fb034553c326a921c705671e863851e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
