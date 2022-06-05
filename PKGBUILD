# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ComplexUpset
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=1.3.3
pkgrel=1
pkgdesc="Create Complex UpSet Plots Using 'ggplot2' Components"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-colorspace
  r-ggplot2
  r-patchwork
  r-scales
)
optdepends=(
  r-covr
  r-data.table
  r-ggplot2movies
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-testthat
  r-tibble
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5b2f99b4a38648641c7d31fc57f201a93e5bc1b85442a0b9726f72c166d964ea')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
