# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigmelon
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Illumina methylation array analysis for large experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-gdsfmt
  r-geoquery
  r-illuminaio
  r-methylumi
  r-minfi
  r-watermelon
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-bumphunter
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylationepicanno.ilm10b2.hg19
  r-minfidata
  r-parallel
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c4f88ee4cccb5da0cf7220f06501eca9fd42d94357d47540c7062f8c13aa3ed0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
