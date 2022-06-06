# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCFA
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='SCFA: Subtyping via Consensus Factor Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biocparallel
  r-clustercrit
  r-glmnet
  r-igraph
  r-keras
  r-matrixstats
  r-psych
  r-rhpcblasctl
  r-tensorflow
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('36bda4b4f631dd71017b35a29615537fb5e4fde1de4b25e34f18492c33941c4f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
