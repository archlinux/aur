# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oligo
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
pkgrel=1
pkgdesc='Preprocessing tools for oligonucleotide arrays'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-affxparser
  r-affyio
  r-biobase
  r-biocgenerics
  r-biostrings
  r-dbi
  r-ff
  r-oligoclasses
  r-preprocesscore
  r-rsqlite
  r-zlibbioc
)
optdepends=(
  r-acme
  r-annotationdbi
  r-biocstyle
  r-biomart
  r-bsgenome.hsapiens.ucsc.hg18
  r-domc
  r-dompi
  r-genefilter
  r-hapmap100kxba
  r-knitr
  r-limma
  r-maqcexpression4plex
  r-oligodata
  r-pd.hg.u95av2
  r-pd.hg18.60mer.expr
  r-pd.huex.1.0.st.v2
  r-pd.hugene.1.0.st.v1
  r-pd.mapping50k.xba240
  r-rcolorbrewer
  r-rcurl
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f1468c9cb38b1a27085c4e7f963f1607cc2862c2a04776b72fab802cc96413ab')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
