# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RTN
_pkgver=2.28.0
pkgname=r-${_pkgname,,}
pkgver=2.28.0
pkgrel=1
pkgdesc='RTN: Reconstruction of Transcriptional regulatory Networks and analysis of regulons'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-car
  r-data.table
  r-igraph
  r-iranges
  r-limma
  r-minet
  r-mixtools
  r-pheatmap
  r-pwr
  r-reder
  r-s4vectors
  r-snow
  r-summarizedexperiment
  r-viper
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c192cdd97beeda7104889fa44eb11a27375f15d527e05fd53ad908cbc747ed27')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
