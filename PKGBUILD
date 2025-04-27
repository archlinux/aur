# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=wateRmelon
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=2.14.0
pkgrel=1
pkgdesc='Illumina 450 and EPIC methylation array normalization and metrics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminaio
  r-limma
  r-lumi
  r-matrixstats
  r-methylumi
  r-roc
)
optdepends=(
  r-biocstyle
  r-flowsorted.blood.450k
  r-flowsorted.blood.epic
  r-illuminahumanmethylationepicanno.ilm10b2.hg19
  r-illuminahumanmethylationepicmanifest
  r-irlba
  r-knitr
  r-minfi
  r-preprocesscore
  r-rmarkdown
  r-rpmm
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d503f137dd9f4c58e819a5926ede8e1569a1731e6531be7b152409b51952fe61')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
