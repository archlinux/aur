# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gghighlight
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=0.3.3
pkgrel=2
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
sha256sums=('018d26b23a0918e5191501997daf9ccb9680692d879e56fef017cb086cb94e47')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
