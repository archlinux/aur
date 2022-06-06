# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GWASTools
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Tools for Genome Wide Association Studies'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-data.table
  r-dbi
  r-dnacopy
  r-gdsfmt
  r-gwasexacthw
  r-lmtest
  r-logistf
  r-quantsmooth
  r-rsqlite
  r-sandwich
)
optdepends=(
  r-biocgenerics
  r-biostrings
  r-genomicranges
  r-gwasdata
  r-iranges
  r-ncdf4
  r-parallel
  r-runit
  r-s4vectors
  r-snprelate
  r-snpstats
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9fc08c28ece2f22ba9b834645f0c2e6bc0105a869f08338012c717a9ae620f58')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
