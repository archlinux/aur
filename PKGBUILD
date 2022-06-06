# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sqldf
_pkgver=0.4-11
pkgname=r-${_pkgname,,}
pkgver=0.4.11
pkgrel=4
pkgdesc='Manipulate R Data Frames Using SQL'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-chron
  r-dbi
  r-gsubfn
  r-proto
  r-rsqlite
)
optdepends=(
  r-mass
  r-rh2
  r-rmysql
  r-rpostgresql
  r-svunit
  r-tcltk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cee979d4e8c67b4924655365d925a8d67104e62adf71741f645cdc5196de2260')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
