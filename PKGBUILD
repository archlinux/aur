# system requirements: libmariadb-client-dev | libmariadb-client-lgpl-dev| libmysqlclient-dev (deb), mariadb-devel (rpm), mariadb |mysql-connector-c (brew), mysql56_dev (csw)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RMySQL
_pkgver=0.10.26
pkgname=r-${_pkgname,,}
pkgver=0.10.26
pkgrel=1
pkgdesc="Database Interface and 'MySQL' Driver for R"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dbi
  mariadb-libs
)
optdepends=(
  r-curl
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('45bb5b20a38b1f7d3a58a1c15c9d57707d603b01a3021423d1d57367a4ef637a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
