# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EMDomics
_pkgver=2.26.0
pkgname=r-${_pkgname,,}
pkgver=2.26.0
pkgrel=1
pkgdesc="Earth Mover's Distance for Differential Analysis of Genomics Data"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocparallel
  r-cdft
  r-emdist
  r-ggplot2
  r-matrixstats
  r-preprocesscore
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('efbfb1857ba6e00797d5171a84d9f43af8e313c05238eb4b7e0c025cc71db692')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
