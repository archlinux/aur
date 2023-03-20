# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterCrit
_pkgver=1.2.8
pkgname=r-${_pkgname,,}
pkgver=1.2.8
pkgrel=8
pkgdesc='Clustering Indices'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  gcc-fortran
)
optdepends=(
  r-rbenchmark
  r-runit
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f375d68b94e5b473c94a439abb15559003b331b84fd93efc1475ae36e30aff82')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
