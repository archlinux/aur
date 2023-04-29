# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=XCIR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=4
pkgdesc='XCI-inference'
arch=('any')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-data.table
  r-ggplot2
  r-iranges
  r-readxl
  r-s4vectors
  r-seqminer
  r-variantannotation
)
optdepends=(
  r-knitr
  r-rmarkdown
)
makedepends=(
  git
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}_${_pkgver}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
