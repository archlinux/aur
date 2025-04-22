# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scCB2
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='CB2 improves power of cell detection in droplet-based single-cell RNA sequencing data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-doparallel
  r-dropletutils
  r-edger
  r-foreach
  r-iterators
  r-rhdf5
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  gcc
)
optdepends=(
  r-beachmat
  r-biocstyle
  r-kernsmooth
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c30cd2d894d5f78d9a29e51bc2b9892e9739ae82e7a1b082cf760d91e8407387')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
