# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OmicsLonDA
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Omics Longitudinal Differential Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-ggplot2
  r-gss
  r-plyr
  r-pracma
  r-summarizedexperiment
  r-zoo
)
optdepends=(
  r-biocmanager
  r-devtools
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b87c110c3fc1d3d0c6590a2f6f26d65b2f1dd87c7592d760d72f9a58bf96b188')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
