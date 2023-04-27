# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scShapes
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='A Statistical Framework for Modeling and Identifying Differential Distributions in Single-cell RNA-sequencing Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-dgof
  r-emdbook
  r-magrittr
  r-pscl
  r-vgam
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7d09e47a5e15335392aa3227dfc3af6359cff7c7d85793ed4af4f2460cf3f07f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
