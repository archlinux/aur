# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gghighlight
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgver=0.3.2
pkgrel=4
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
  r-knitr
  r-rmarkdown
  r-sf
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5b543e550acb216beb1f80d2a41c9fb13c88ee29932185b98238fc9e35b1af2f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
