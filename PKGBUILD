# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=umap
_pkgver=0.2.9.0
pkgname=r-${_pkgname,,}
pkgver=0.2.9.0
pkgrel=1
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
sha256sums=('551bc189e1e6856bf306e316c461095102a2d034e0cf93691d48b73b13d80289')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
