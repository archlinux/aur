# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocWorkflowTools
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Tools to aid the development of Bioconductor Workflow packages'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocstyle
  r-bookdown
  r-git2r
  r-httr
  r-knitr
  r-rmarkdown
  r-rstudioapi
  r-stringr
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8bb7f2a6164ea3f969689d011ceb55f3f913dbafb1fd565e928a054fd436b6a4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
