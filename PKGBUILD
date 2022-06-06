# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=penalized
_pkgver=0.9-52
pkgname=r-${_pkgname,,}
pkgver=0.9.52
pkgrel=1
pkgdesc='L1 (Lasso and Fused Lasso) and L2 (Ridge) Penalized Estimation in GLMs and in the Cox Model'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-globaltest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d8e38e6c4e993c74998ca8f986b4e11e09c0b9971103e1d5c7ebdee75f6d6a21')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
