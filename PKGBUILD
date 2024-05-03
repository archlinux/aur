# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VaSP
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Quantification and Visualization of Variations of Splicing in Population'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ballgown
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-matrixstats
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('64fc8e615dc049cbff7c8884de96c74ad19c9a8974300eded84d4911d9ab00be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
