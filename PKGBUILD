# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ncdfFlow
_pkgver=2.52.1
pkgname=r-${_pkgname,,}
pkgver=2.52.1
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
  r-cpp11
  r-flowcore
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
sha256sums=('701f98e17c1d2e12d192fa97fe7b72bdd6d9f966c35e6180a5dd66ef948b17eb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
#  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
