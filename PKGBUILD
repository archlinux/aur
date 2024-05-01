# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SNPRelate
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Parallel Computing Toolset for Relatedness and Principal Component Analysis of SNP Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-gdsfmt
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-markdown
  r-mass
  r-matrix
  r-parallel
  r-rmarkdown
  r-runit
  r-seqarray
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ae7c666147e00c6a417fb735b2ca31b907727d0e59a09e67bd7e4265f74ed37e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
