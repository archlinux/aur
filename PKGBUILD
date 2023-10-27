# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gmoviz
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Seamless visualization of complex genomic variations in GMOs and edited cell lines'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-circlize
  r-colorspace
  r-complexheatmap
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-gridbase
  r-iranges
  r-pracma
  r-rsamtools
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-pasillabamsubset
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('962fd20aa4e036f14594ed7dc1afdc305ee9ea53824e6d2ba12592fa1049191c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
