# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NetSAM
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
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
sha256sums=('033a6ac5929cc06230671de281e17a3fe7a0265632e7d960c0a2f1b600c3d86f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
