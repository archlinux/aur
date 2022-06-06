# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rmeta
_pkgver=3.0
pkgname=r-${_pkgname,,}
pkgver=3.0
pkgrel=4
pkgdesc='Meta-Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b9f9d405935cffcd7a5697ff13b033f9725de45f4dc7b059fd68a7536eb76b6e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
