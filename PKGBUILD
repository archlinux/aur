# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msigdbr
_pkgver=26.1.1
pkgname=r-${_pkgname,,}
pkgver=26.1.1
pkgrel=1
pkgdesc='MSigDB Gene Sets for Multiple Organisms in a Tidy Data Format'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-babelgene
  r-dplyr
  r-rlang
  r-tibble
  r-tidyselect
  r-assertthat
  r-curl
  r-lifecycle
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b66ffc38bde56230da60f6d9af3dd363d0cb7a0b4b7693e5001c3634cb5eb58f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
