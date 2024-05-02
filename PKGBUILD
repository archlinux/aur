# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneGeneInteR
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Tools for Testing Gene-Gene Interaction at the Gene Level'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-factominer
  r-genomicranges
  r-igraph
  r-iranges
  r-kernlab
  r-mvtnorm
  r-rsamtools
  r-snpstats
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('875035b73649a31fea31fe78c96870df613c87bd1fdc151e78c6bdf32d89a915')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
