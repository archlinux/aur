# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCFA
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='SCFA: Subtyping via Consensus Factor Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biocparallel
  r-clustercrit
  r-coro
  r-glmnet
  r-igraph
  r-matrixstats
  r-psych
  r-rhpcblasctl
  r-torch
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fe245f36402a470f79088f5b83ae740e74728a4197f206f964c823f3de87e709')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
