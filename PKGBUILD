# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SIMLR
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Single-cell Interpretation via Multi-kernel LeaRning (SIMLR)'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-pracma
  r-rcpp
  r-rcppannoy
  r-rspectra
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-igraph
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c2ef6d4192386ee1e3228c6a34e7d545b1c974c44fe56e5385222ae22609adbb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
