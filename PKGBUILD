# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccfindR
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Cancer Clone Finder'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  gsl
  r
  r-ape
  r-gtools
  r-irlba
  r-rcolorbrewer
  r-rcpp
  r-rcppeigen
  r-rdpack
  r-rmpi
  r-rtsne
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1775e1fe4da3508e7878a0a80b8b3ae05bdc764b47a72f05fe2a3308f5d90388')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
