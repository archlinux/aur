# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timescape
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Patient Clonal Timescapes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-gtools
  r-htmlwidgets
  r-jsonlite
  r-stringr
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2295c0d470f8b8164503853434c3d028f809f4736cdf2d617ea04a00ae6cee78')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
