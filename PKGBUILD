# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=a4Classif
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='Automated Affymetrix Array Analysis Classification Package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-a4core
  r-a4preproc
  r-biobase
  r-glmnet
  r-pamr
  r-rocr
  r-varselrf
)
optdepends=(
  r-all
  r-hgu95av2.db
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('11eed6423093009dcb8b0ac68000bb92fbab5a024d47552701b28e053df6b3f3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
