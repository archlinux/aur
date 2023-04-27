# system requirements: GNU make, C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cytolib
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
pkgrel=1
pkgdesc='C++ infrastructure for representing and interacting with the gated cytometry data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  gcc
  make
  r
  r-bh
  r-rhdf5lib
  r-rprotobuflib
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('82d45fe04f94f3765417f5307db26a9dbaaf22691350708dc68460288149a864')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
