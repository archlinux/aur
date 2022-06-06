# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TraRe
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Transcriptional Rewiring'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocparallel
  r-dqrng
  r-ggplot2
  r-glmnet
  r-gplots
  r-gtools
  r-hash
  r-igraph
  r-matrixstats
  r-pvclust
  r-r.utils
  r-summarizedexperiment
  r-vbsr
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c85a397ceecea37954dad5578bbb5ece0287ac11d5931ab6b2d64c8cdc772aef')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
