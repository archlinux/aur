# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusteval
_pkgver=0.1
pkgname=r-${_pkgname,,}
pkgver=0.1
pkgrel=6
pkgdesc='Evaluation of Clustering Algorithms'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${pkgver}.tar.gz")
sha256sums=('329f0f1fd5b9fcd1fa253d0c8d1373d7b0eed919eacc51bfd30d7947685ba0d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
#  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
