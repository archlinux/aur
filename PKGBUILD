# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=repmis
_pkgver=0.5.1
pkgname=r-${_pkgname,,}
pkgver=0.5.1
pkgrel=1
pkgdesc='Miscellaneous Tools for Reproducible Research'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-digest
  r-httr
  r-plyr
  r-r.cache
)
optdepends=(
  r-xlsx
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('371f8e08f61a2f71d0b1582f170535f8b92b1ea66c328ddb02b1bf984e283f1d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
