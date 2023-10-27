# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cn.farms
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='cn.FARMS - factor analysis for copy number estimation'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-affxparser
  r-biobase
  r-dbi
  r-dnacopy
  r-ff
  r-oligo
  r-oligoclasses
  r-preprocesscore
  r-snow
)
optdepends=(
  r-pd.genomewidesnp.5
  r-pd.genomewidesnp.6
  r-pd.mapping250k.nsp
  r-pd.mapping250k.sty
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f95f47ed1c9d573e8dc0ef158ccb0dd9d61f9357b24560c7d99b65ca8e8e56ad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
