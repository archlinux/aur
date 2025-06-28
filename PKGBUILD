# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=restfulr
_pkgver=0.0.16
pkgname=r-${_pkgname,,}
pkgver=0.0.16
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
sha256sums=('574fd11a3f23f494ff8e94ce84d767f49d3399600d617ad26fb71b8332e93725')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
