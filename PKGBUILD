# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ddPCRclust
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Clustering algorithm for ddPCR data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-clue
  r-flowcore
  r-flowdensity
  r-flowpeaks
  r-ggplot2
  r-openxlsx
  r-plotrix
  r-r.utils
  r-samspectral
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b789c218722571e5bb1d6c643f235ba71eb6f98325ba119317ceafcfa787b65a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
