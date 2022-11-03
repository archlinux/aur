# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ncdfFlow
_pkgver=2.44.0
pkgname=r-${_pkgname,,}
pkgver=2.44.0
pkgrel=1
pkgdesc='ncdfFlow: A package that provides HDF5 based storage for flow cytometry data.'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-bh
  r-biobase
  r-biocgenerics
  r-flowcore
  r-rcpp
  r-rcpparmadillo
  r-rhdf5lib
  r-zlibbioc
)
optdepends=(
  r-flowstats
  r-knitr
  r-parallel
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f5473d14e8ebe59988a0dde0c1d8d2245dbae71d3bbdf6c9b729a10c5ace612a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
#  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
