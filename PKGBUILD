# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrayMvout
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=1.70.0
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
sha256sums=('b269c5a9c2b8c81c12c14da079922cedd80ed802ee07bf7baec924891ffbbba8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
