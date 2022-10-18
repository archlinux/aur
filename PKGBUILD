# system requirements: libmariadb-client-dev | libmariadb-client-lgpl-dev| libmysqlclient-dev (deb), mariadb-devel (rpm), mariadb |mysql-connector-c (brew), mysql56_dev (csw)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RMySQL
_pkgver=0.10.24
pkgname=r-${_pkgname,,}
pkgver=0.10.24
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
sha256sums=('ca1b9aacab6d76866ba09210ae881c3a7555bd5144ea0a0a446fceff80637241')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
