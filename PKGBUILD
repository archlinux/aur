# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=waddR
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Statistical tests for detecting differential distributions based on the 2-Wasserstein distance'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-arm
  r-biocfilecache
  r-biocparallel
  r-eva
  r-rcpp
  r-rcpparmadillo
  r-singlecellexperiment
)
optdepends=(
  r-devtools
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-rprojroot
  r-scater
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f4e289f0a83a40d9488791a78c781a4e2cb21c2fef1a5309511b0b74680d6bc8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
