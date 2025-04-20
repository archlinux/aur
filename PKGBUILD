# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=girafe
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=1.60.0
pkgrel=1
pkgdesc='Genome Intervals and Read Alignments for Functional Exploration'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biostrings
  r-genomeintervals
  r-intervals
  r-iranges
  r-rsamtools
  r-s4vectors
  r-shortread
)
optdepends=(
  r-genomeintervals
  r-mass
  r-org.mm.eg.db
  r-rcolorbrewer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('07049986e2daa718cef548649baae897704325055c24dac61fb1238f725d8e19')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
