# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lumi
_pkgver=2.52.0
pkgname=r-${_pkgname,,}
pkgver=2.52.0
pkgrel=1
pkgdesc='BeadArray Specific Methods for Illumina Methylation and Expression Microarrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-affy
  r-annotate
  r-annotationdbi
  r-biobase
  r-dbi
  r-genomicfeatures
  r-genomicranges
  r-methylumi
  r-nleqslv
  r-preprocesscore
  r-rsqlite
)
optdepends=(
  r-beadarray
  r-genefilter
  r-limma
  r-lumibarnes
  r-lumihumanall.db
  r-lumihumanidmapping
  r-rcolorbrewer
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f2da7e6f801f904034918377173702e29eb61a58b22459a4ceb2c9d44fc6bdd3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
