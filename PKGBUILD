# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fCI
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='f-divergence Cutoff Index for Differential Expression Analysis in Transcriptomics and Proteomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-fnn
  r-gtools
  r-psych
  r-rgl
  r-venndiagram
  r-zoo
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a0253b834387b036a6557219f910da8131e85aecfe01943f52dccc53b86ff96b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
