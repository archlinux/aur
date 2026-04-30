# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SNPRelate
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Parallel Computing Toolset for Relatedness and Principal Component Analysis of SNP Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r-rhpcblasctl
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
sha256sums=('ca4498428bdea23b04cc731eb7f0fc94b8803a23c30ab062c56fee0f401f589f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
