# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=synapter
_pkgver=2.22.0
pkgname=r-${_pkgname,,}
pkgver=2.22.0
pkgrel=1
pkgdesc='Label-free data analysis pipeline for optimal identification and quantitation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcolorbrewer
  r-qvalue
  r-multtest
  r-biobase
  r-knitr
  r-biostrings
  r-cleaver
  r-readr
  r-rmarkdown
  r-msnbase
)
makedepends=(
  git
  tar
)
optdepends=(
  r-synapterdata
  r-xtable
  r-testthat
  r-brain
  r-biocstyle
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}.git")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

