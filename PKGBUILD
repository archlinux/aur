# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccfindR
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
sha256sums=('8fca4640dbaa52151dfd940dbbc80ee21374d9d351575a85e2e452819939a38e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
