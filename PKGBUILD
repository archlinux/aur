# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=edgeR
_pkgver=3.40.1
pkgname=r-${_pkgname,,}
pkgver=3.40.1
pkgrel=1
pkgdesc='Empirical Analysis of Digital Gene Expression Data in R'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-limma
  r-locfit
  r-rcpp
  gcc
)
optdepends=(
  r-annotationdbi
  r-biobase
  r-jsonlite
  r-org.hs.eg.db
  r-readr
  r-rhdf5
  r-splines
  r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ef432cfddb2eaa27973085b26ccd2540bacb782415891ec58d15574c3fab19a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
