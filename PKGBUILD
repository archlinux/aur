# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rncl
_pkgver=0.8.7
pkgname=r-${_pkgname,,}
pkgver=0.8.7
pkgrel=1
pkgdesc='An Interface to the Nexus Class Library'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
  r-progress
  r-rcpp
)
optdepends=(
  r-ape
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1d876e4f5f2b8a24cc3ea1002c29eedbc0ca96011b0fa15b085e5b75cfc7993a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
