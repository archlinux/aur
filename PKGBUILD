# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pulsedSilac
_pkgver=1.9.1
pkgname=r-${_pkgname,,}
pkgver=1.9.1
pkgrel=1
pkgdesc='Analysis of pulsed-SILAC quantitative proteomics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cowplot
  r-ggplot2
  r-ggridges
  r-mumin
  r-r.utils
  r-robustbase
  r-s4vectors
  r-summarizedexperiment
  r-tarifx
  r-upsetr
)
optdepends=(
  r-gridextra
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8b4a5597eaf54181566e0ff3d6bf5d72d81e71583c6fa7abcd2c1398f4ef68fd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
