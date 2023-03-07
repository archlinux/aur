# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=gson
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=0.1.0
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
sha256sums=('14ddbee5be66d0b1dc178e41175a50ab6ed9ffed04d4361ecf5eef3548d9a381')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
