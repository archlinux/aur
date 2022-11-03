# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epidecodeR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='epidecodeR: a functional exploration tool for epigenetic and epitranscriptomic regulation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-envstats
  r-genomicranges
  r-ggplot2
  r-ggpubr
  r-iranges
  r-rstatix
  r-rtracklayer
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e4ecb02c77f60ed190e9c85907d3f898c71f8550975f48d766e47add4548cb61')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
