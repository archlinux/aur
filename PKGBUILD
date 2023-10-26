# system requirements: C++11, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SAIGEgds
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=2.2.0
pkgrel=1
pkgdesc='Scalable Implementation of Generalized mixed models using GDS files in Phenome-Wide Association Studies'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-gdsfmt
  r-rcpp
  r-rcpparmadillo
  r-rcppparallel
  r-seqarray
)
optdepends=(
  r-biocgenerics
  r-compquadform
  r-crayon
  r-ggmanh
  r-knitr
  r-markdown
  r-parallel
  r-rmarkdown
  r-runit
  r-snprelate
  r-survey
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3fe54365f694f96e5bd4f07d76557e5f14ed95ce021220ee4cedc77606a7d071')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
