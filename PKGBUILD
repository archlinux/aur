# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnVILPublish
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Publish Packages and Other Resources to AnVIL Workspaces'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-anvil
  r-httr
  r-jsonlite
  r-readr
  r-rmarkdown
  r-whisker
  r-yaml
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3db141bc70bcbd24393d7945853e518a53102dec3ca56c89d397c54c81a99bc7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
