# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RPostgreSQL
_pkgver=0.7-4
pkgname=r-${_pkgname,,}
pkgver=0.7.4
pkgrel=1
pkgdesc="R Interface to the 'PostgreSQL' Database System"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dbi
  postgresql-libs
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b6adf60094f2b03dff1959147cde7f61c2f4c4576d77b2a263c63f8e3cd556c6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
