# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TraRe
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=1.5.0
pkgrel=4
pkgdesc='Transcriptional Rewiring'
arch=('any')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
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
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2ca6b5337fc801cfa6dabf80c50c89844325979cc626e5236ca52ac9c5cc851b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
