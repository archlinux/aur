# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=jackstraw
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=1.3.1
pkgrel=2
pkgdesc='Statistical Inference for Unsupervised Learning'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-clusterr
  r-corpcor
  r-irlba
  r-lfa
  r-qvalue
  r-rsvd
)
optdepends=(
  r-knitr
  r-parallel
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('41a987fa4c3ef259afc2f068e36b3c06a8a7eee4973ef6ef7f46d6a5bd572051')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
