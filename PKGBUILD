# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=wateRmelon
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=2.8.0
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
sha256sums=('34a5441688298f8b710b607a89fd52f9a5b50d89fda7a744f196a5683f0e42e5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
