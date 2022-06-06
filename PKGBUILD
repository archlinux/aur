# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=softImpute
_pkgver=1.4-1
pkgname=r-${_pkgname,,}
pkgver=1.4.1
pkgrel=4
pkgdesc='Matrix Completion via Iterative Soft-Thresholded SVD'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ea4c39831dee834204f6d6594aad6b937540ba4f2adf3f37fb4546844c234aec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
