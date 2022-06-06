# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nnlasso
_pkgver=0.3
pkgname=r-${_pkgname,,}
pkgver=0.3
pkgrel=4
pkgdesc='Non-Negative Lasso and Elastic Net Penalized Generalized Linear Models'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('646250cba6189cdc83fcea7f7b9b07a4f7ba79593d75c77dfac1e0576956f3d8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
