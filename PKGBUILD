# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sqldf
_pkgver=0.4-12
pkgname=r-${_pkgname,,}
pkgver=0.4.12
pkgrel=1
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
sha256sums=('954cec7b3ae5f4470ea2bc3df843c25ab53dcfc65e37ba398cd304e42c95fbfa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
