# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gaga
_pkgver=2.52.0
pkgname=r-${_pkgname,,}
pkgver=2.52.0
pkgrel=1
pkgdesc='GaGa hierarchical model for high-throughput data analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-coda
  r-ebarrays
)
optdepends=(
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cdb5ba9dc6470cca69ea6bf3c2dc5f95f939722eb05a134bde5650fd955de28a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
