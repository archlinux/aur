# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiGSEA
_pkgver=1.8.2
pkgname=r-${_pkgname,,}
pkgver=1.8.2
pkgrel=1
pkgdesc='Combining GSEA-based pathway enrichment with multi omics data integration'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-dplyr
  r-fgsea
  r-graphite
  r-magrittr
  r-metap
  r-rappdirs
  r-rlang
)
optdepends=(
  r-biocstyle
  r-knitr
  r-metaboliteidmapping
  r-org.bt.eg.db
  r-org.ce.eg.db
  r-org.cf.eg.db
  r-org.dm.eg.db
  r-org.dr.eg.db
  r-org.gg.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.rn.eg.db
  r-org.ss.eg.db
  r-org.xl.eg.db
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08b7ae63d556ec6713d3431477f26e6dedb2a30aa3d1b0756c4cdb7d7f6e19e9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
