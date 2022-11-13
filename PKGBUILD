# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=gson
_pkgver=0.0.9
pkgname=r-${_pkgname,,}
pkgver=0.0.9
pkgrel=1
pkgdesc="Base Class and Methods for 'gson' Format"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-jsonlite
  r-rlang
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f694765cd2872efb73dd7be66ef8e31395915f9b277f59e0891cff138777b118')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
