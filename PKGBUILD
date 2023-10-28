# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASpli
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
pkgrel=1
pkgdesc='Analysis of Alternative Splicing Using RNA-Seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biocstyle
  r-data.table
  r-dt
  r-edger
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-gviz
  r-htmltools
  r-igraph
  r-iranges
  r-limma
  r-pbmcapply
  r-rsamtools
  r-s4vectors
  r-tidyr
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5e9ec698127d453cde27310b815b047da4114e0c89a00032104c38b7f7004166')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
