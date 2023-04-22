# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicTools
_pkgver=0.2.9.7
pkgname=r-${_pkgname,,}
pkgver=0.2.9.7
pkgrel=6
pkgdesc='Collection of Tools for Genomic Data Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-circlize
  r-data.table
  r-genomictools.filehandler
  r-gmwt
  r-rcpp
  r-rcpparmadillo
  r-snpstats
  r-stringr
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('15fcf653177f3b9cb822c4da08d7cc5507b9f48d4a6ca58e523c3e965787daa4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
