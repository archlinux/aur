# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrayMvout
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=1.66.0
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
sha256sums=('c35ee3cb906c0a3125e3693aac20b5af7003d700494949a687e935ee381de7ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
