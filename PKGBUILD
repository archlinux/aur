# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=umap
_pkgver=0.2.8.0
pkgname=r-${_pkgname,,}
pkgver=0.2.8.0
pkgrel=3
pkgdesc='Uniform Manifold Approximation and Projection'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-openssl
  r-rcpp
  r-reticulate
  r-rspectra
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('57718187922a4e5746a0e014b913e451419d934bad3b149f18893ec4becd2a2a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
