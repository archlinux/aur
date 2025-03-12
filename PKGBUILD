# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msigdbr
_pkgver=10.0.0
pkgname=r-${_pkgname,,}
pkgver=10.0.0
pkgrel=1
pkgdesc='MSigDB Gene Sets for Multiple Organisms in a Tidy Data Format'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-babelgene
  r-dplyr
  r-magrittr
  r-rlang
  r-tibble
  r-tidyselect
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08d7e9b460a248f48b9e586dd126e713c1cef97a0cc512f943e4b843ce07a1b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
