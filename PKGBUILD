# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=skewr
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc="Visualize Intensities Produced by Illumina's Human Methylation 450k BeadChip"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-illuminahumanmethylation450kmanifest
  r-methylumi
  r-minfi
  r-mixsmsn
  r-rcolorbrewer
  r-s4vectors
  r-watermelon
)
optdepends=(
  r-geoquery
  r-knitr
  r-minfidata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('83a65ce9c0f85e470cb1f45e71785b8592d25e0b39aa99bbfa1c37e7a507002d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
