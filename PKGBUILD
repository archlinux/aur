# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nnNorm
_pkgver=2.70.0
pkgname=r-${_pkgname,,}
pkgver=2.70.0
pkgrel=1
pkgdesc='Spatial and intensity based normalization of cDNA microarray data based on robust neural nets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-marray
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b65838b641d006c942eb73ce20854cfd77c46bad760e5265c7144a97576b23b3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
