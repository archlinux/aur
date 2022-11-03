# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnVILPublish
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
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
sha256sums=('5c536ee4e581ea6a934ed321c6a29dafac86cb6a95e9fb46d826feecef71bfc4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
