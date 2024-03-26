# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=deltaCaptureC
_pkgver=1.16.1
pkgname=r-${_pkgname,,}
pkgver=1.16.1
pkgrel=1
pkgdesc='This Package Discovers Meso-scale Chromatin Remodeling from 3C Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-deseq2
  r-genomicranges
  r-ggplot2
  r-iranges
  r-summarizedexperiment
  r-tictoc
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e40fd19dddc7a2fff077b9a5ad917d1726604a3b84aa7e51c88f9f4a645bc53')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
