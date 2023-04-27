# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=a4Classif
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
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
sha256sums=('bbfe2f3a4d4f81b722ee17d4f76ae001c21ce328c9f470e635606d59fef5bdfc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
