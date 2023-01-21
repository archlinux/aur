# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HDTD
_pkgver=1.32.2
pkgname=r-${_pkgname,,}
pkgver=1.32.2
pkgrel=1
pkgdesc='Statistical Inference about the Mean Matrix and the Covariance Matrices in High-Dimensional Transposable Data (HDTD)'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('649f625e2ede8a690d1a955f36fe6a1d1eba249835f7e7fec343a52695b45bcd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
