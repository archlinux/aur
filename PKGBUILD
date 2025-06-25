# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gghighlight
_pkgver=0.5.0
pkgname=r-${_pkgname,,}
pkgver=0.5.0
pkgrel=1
pkgdesc="Highlight Lines and Points in 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-lifecycle
  r-purrr
  r-rlang
  r-tibble
)
optdepends=(
  r-geomtextpath
  r-knitr
  r-rmarkdown
  r-sf
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c1bfc816ee17107329cfb46f3b0cc76b0d131268c217e205a4bfc0e5d4d42946')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
