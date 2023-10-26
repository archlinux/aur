# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=blima
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Tools for the preprocessing and analysis of the Illumina microarrays on the detector (bead) level'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-beadarray
  r-biobase
  r-biocgenerics
  r-rcpp
)
optdepends=(
  r-biocstyle
  r-blimatestingdata
  r-illuminahumanv4.db
  r-knitr
  r-lumi
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('71d0a28e7762cff920a3889fc256d922ce99383b0015657708b006a7453ae296')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
