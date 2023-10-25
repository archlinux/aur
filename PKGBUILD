# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocWorkflowTools
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
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
sha256sums=('a512296cd5c5ed6a3d8874378f7f5b4cd620c35e17ada1ad2918ea7ca3a60756')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
