# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCFA
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='SCFA: Subtyping via Consensus Factor Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biocparallel
  r-coro
  r-glmnet
  r-igraph
  r-matrixstats
  r-psych
  r-rhpcblasctl
  r-torch
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e8501c609382cb4946ed7ac64c0ae1e7f5df40d58771aa6c663c75f6aeaf779d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
