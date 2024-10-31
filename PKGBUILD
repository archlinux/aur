# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SIMLR
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
sha256sums=('7d80fa9209b01c6cb69950d3ddf8d3140b6e082eb49b1c751f2b28df8fe361e2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
