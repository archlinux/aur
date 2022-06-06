# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tsne
_pkgver=0.1-3.1
pkgname=r-${_pkgname,,}
pkgver=0.1.3.1
pkgrel=3
pkgdesc='T-Distributed Stochastic Neighbor Embedding for R (t-SNE)'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('14abc65bc0a3f3ed63c04dda19620e483a21d1f5f33feb74aba9f3221434d888')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
