# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=funtooNorm
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Normalization Procedure for Infinium HumanMethylation450 BeadChip Kit'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomeinfodb
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylation450kmanifest
  r-matrixstats
  r-minfi
  r-pls
)
optdepends=(
  r-knitr
  r-minfidata
  r-prettydoc
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('feb2b6871866271fd1334c268debe865113351fce4a98b9163644b939160c261')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
