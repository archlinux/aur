# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mimager
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='mimager: The Microarray Imager'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-affy
  r-affyplm
  r-biobase
  r-biocgenerics
  r-dbi
  r-gtable
  r-oligo
  r-oligoclasses
  r-preprocesscore
  r-s4vectors
  r-scales
)
optdepends=(
  r-abind
  r-affydata
  r-biocstyle
  r-hgu95av2cdf
  r-knitr
  r-lintr
  r-matrix
  r-oligodata
  r-pd.hugene.1.0.st.v1
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4281bfe81e18cacbac723c3f483c0fbd6d8e4837b605007b093da19f939d3994')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
