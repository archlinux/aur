# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HilbertVis
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=1.54.0
pkgrel=1
pkgdesc='Hilbert curve visualization'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-ebimage
  r-iranges
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('65a59b9a44fb8456b099022aa4c62fc5599ea7458481b44bdadf7afead41916d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
