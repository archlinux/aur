# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowBin
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='Combining multitube flow cytometry data by binning'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-flowcore
  r-flowfp
  r-limma
  r-snow
)
optdepends=(
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a1eb1247dd0002dc4addd3db85f777a241f8200ca12205aeb6e49ac85c5a59ac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
