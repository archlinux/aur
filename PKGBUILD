# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccfindR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
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
sha256sums=('3bdaffd17816f6facfa99a8e6ef7c2948fa2ff1a3e863a267960c38e1128e5bd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
