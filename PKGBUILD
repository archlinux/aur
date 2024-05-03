# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrayMvout
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
pkgrel=1
pkgdesc='multivariate outlier detection for expression array QA'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-affy
  r-affycontam
  r-biobase
  r-lumi
  r-mdqc
  r-parody
)
optdepends=(
  r-affydata
  r-affyplm
  r-hgu133atagcdf
  r-lumibarnes
  r-maqcsubset
  r-mvoutdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bc170bc1275e9c92c072b334db4adbe32c99a4034bb186b96e50792b4ed26387')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
