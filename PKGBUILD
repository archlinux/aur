# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ddPCRclust
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('2dbbf5ec80d09d8023b3a2abd7aa92cf31672343d12795a0e0413c4a29f8cb7f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
