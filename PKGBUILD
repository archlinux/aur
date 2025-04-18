# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gage
_pkgver=2.58.0
pkgname=r-${_pkgname,,}
pkgver=2.58.0
pkgrel=1
pkgdesc='Generally Applicable Gene-set Enrichment for Pathway Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-go.db
  r-graph
  r-keggrest
)
optdepends=(
  r-deseq2
  r-edger
  r-gagedata
  r-genomicalignments
  r-gseabase
  r-hgu133a.db
  r-limma
  r-org.hs.eg.db
  r-pathview
  r-rsamtools
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b97960ed7a3aef8e1a9c4d887d965ea03c54635ac63c383ac747737ae328cc3a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
