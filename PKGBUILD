# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=restfulr
_pkgver=0.0.17
pkgname=r-${_pkgname,,}
pkgver=0.0.17
pkgrel=1
pkgdesc='R Interface to RESTful Web Services'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-rcurl
  r-rjson
  r-s4vectors
  r-xml
  r-yaml
)
optdepends=(
  r-getpass
  r-rsolr
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e50b9c4a9886f3756a9610f89f24d4de97262e7c5769dc3e4824ce888c304057')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
